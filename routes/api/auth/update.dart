import 'dart:io';

import 'package:backend/constants.dart';
import 'package:backend/repository/session/session_repository.dart';
import 'package:backend/utils/auth_header.dart';
import 'package:backend/utils/output_response.dart';
import 'package:backend/utils/request_method.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db_models/db_models.dart' as db;
import 'package:shared_models/shared_models.dart' as shared;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  return requestMethod(context.request, HttpMethod.post) ??
      authHeader(context) ??
      await _updateUser(context);
}

Future<Response> _updateUser(RequestContext context) async {
  final token = context.request.headers[tokenHeaderName]!;
  final session = context.read<SessionRepository>();
  final id = session.getUserIdForToken(token);
  final database = context.read<Database>();
  final dbUser = await database.users.queryUser(id!);
  if (dbUser != null && dbUser.token == token) {
    final body = await context.request.json() as Map<String, dynamic>;

    final newname = body['user_name'] as String?;
    if (newname!= null && newname.isNotEmpty) {
      final request = db.UserUpdateRequest(
        id: dbUser.id,
        userName: newname,

        // maybe something more
      );
      await database.users.updateOne(request);

      var outUser = shared.User.fromUserView(dbUser);
      outUser = outUser.copyWith(
        userName: newname,
      );
      return createResponse(
          HttpStatus.created, StatusMessage.statusSuccess, 'User was updated',
          outUser.toJson());
      } else {
      return createResponse(HttpStatus.upgradeRequired, StatusMessage.statusFailed, 'User not found');
    }
    }
  else {
    /// frontend must start from login screen. check statusCode == 426,
    return createResponse(HttpStatus.upgradeRequired, StatusMessage.statusFailed, 'Token is expired. You have to login');
  }
}
