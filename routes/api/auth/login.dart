import 'dart:io';

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
      //authHeader(context) ??
      await _login(context);
}

/// input:
/// shared.User(email: 'user@email.com', password: 'password', deviceId: 'UUID of device')
Future<Response> _login(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  shared.User? inUser;

  try { // if some shit as "user" was sent to this entryPoint
    inUser = shared.User.fromJson(body);
  } catch (e) {
    return createResponse(HttpStatus.badRequest, 'failed', 'Invalid syntax in request');
  }
  //
  final inPassword = inUser.password?.hashValue;
  final database = context.read<Database>();
  // better to use database.users.query(), but i don't know how
  final rawResult = await database.query("SELECT * FROM users WHERE email = '${inUser.email}' AND password = '$inPassword'");
  if (rawResult.length != 1){
    return createResponse(HttpStatus.badRequest, 'failed', 'User not found');
  }

  // fill inUser with database data
  inUser = inUser.copyWith(
    id: rawResult.first.toColumnMap()['id'] as int,
    userName: rawResult.first.toColumnMap()['user_name'] as String,
    email: rawResult.first.toColumnMap()['email'] as String,
    deviceId: rawResult.first.toColumnMap()['device_id'] as String,
    avatarUrl: rawResult.first.toColumnMap()['avatar_url'] as String?,
    password: rawResult.first.toColumnMap()['password'] as String?,
    emailVerified: rawResult.first.toColumnMap()['email_verified'] as bool?,
    emailVerificationLink: rawResult.first.toColumnMap()['email_verification_link'] as String?,
    token: rawResult.first.toColumnMap()['token'] as String?,
    referalCode: rawResult.first.toColumnMap()['referal_code'] as String?,
  );

  if (inUser.emailVerified ?? false){
    // update token in 'users' table
    final generatedToken = '${inUser.email}|${inUser.deviceId}|${inUser.password}'.baseToken;
    final updateRequest = db.UserUpdateRequest(
      id: inUser.id,
      token: generatedToken,
    );
    await database.users.updateOne(updateRequest);
    // update token in realtime cache
    final session = context.read<SessionRepository>()
      ..addSession(inUser.id, generatedToken);

    inUser = inUser.copyWith(token: generatedToken);

    return createResponse(HttpStatus.ok, 'success', 'User was found', inUser.toJson());
  }
  /// frontend must show an alert dialog. check statusCode==226
  return createResponse(HttpStatus.imUsed, 'failed', 'Email must be verified');
}