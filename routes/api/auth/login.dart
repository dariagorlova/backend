import 'dart:io';

import 'package:backend/constants.dart';
import 'package:backend/extensions/string_hash_extension.dart';
import 'package:backend/repository/session/session_repository.dart';
import 'package:backend/utils/output_response.dart';
import 'package:backend/utils/request_method.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db_models/db_models.dart' as db;
import 'package:shared_models/shared_models.dart' as shared;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  return requestMethod(context.request, HttpMethod.get) ??
      await _login(context);
}

/// input: {
/// "email": "user@email.com",
/// "password": "password",
/// "device_id": "UUID of device"
/// }
Future<Response> _login(RequestContext context) async {
  try {
    final body = await context.request.json() as Map<String, dynamic>;
    final inPassword = (body['password'] as String).hashValue;
    final inEmail = body['email'] as String;
    final inDeviceId = body['device_id'] as String;

    final database = context.read<Database>();
    final queryUsers = await database.users.queryUsers(
      QueryParams(
        where: 'email=@email AND password=@password',
        values: {'email': inEmail, 'password': inPassword},
      ),
    );

    if (queryUsers.length != 1) {
      return createResponse(HttpStatus.badRequest, StatusMessage.statusFailed, 'User not found');
    }

    var foundUser = shared.User.fromUserView(queryUsers.first);
    if (foundUser.emailVerified ?? false) {
      // update token in 'users' table
      final generatedToken = '${foundUser.email}|${foundUser
          .deviceId}|${foundUser.password}'.baseToken;
      final updateRequest = db.UserUpdateRequest(
        id: foundUser.id,
        token: generatedToken,
        deviceId: inDeviceId,
      );
      await database.users.updateOne(updateRequest);
      // update token in realtime cache
      context.read<SessionRepository>().addSession(
          foundUser.id, generatedToken);

      foundUser =
          foundUser.copyWith(token: generatedToken, deviceId: inDeviceId);
      return createResponse(
          HttpStatus.ok, StatusMessage.statusSuccess, 'User was found',
          foundUser.toJson());
    }

    /// frontend must show an alert dialog. check statusCode==226
    return createResponse(HttpStatus.imUsed, StatusMessage.statusFailed,
        'Email must be verified');
  } catch (_){
    return createResponse(HttpStatus.badRequest, StatusMessage.statusFailed, 'Invalid syntax in request');
  }
}