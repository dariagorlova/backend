import 'dart:io';

import 'package:backend/constants.dart';
import 'package:backend/repository/session/session_repository.dart';
import 'package:backend/utils/auth_header.dart';
import 'package:backend/utils/output_response.dart';
import 'package:backend/utils/request_method.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db_models/db_models.dart' as db;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  return requestMethod(context.request, HttpMethod.post) ??
      authHeader(context) ??
      await _deleteUser(context);
}

/// input:
/// token in header and empty body
Future<Response> _deleteUser(RequestContext context) async {
  final token = context.request.headers[tokenHeaderName]!;
  final session = context.read<SessionRepository>();
  final id = session.getUserIdForToken(token);
  final database = context.read<Database>();
  final dbUser = await database.users.queryUser(id!);
  if (dbUser != null && dbUser.token == token) {
    await database.users.deleteOne(id);
    session.removeSession(token);
    return createResponse(HttpStatus.badRequest, StatusMessage.statusSuccess, 'User was deleted');
  }
  else {
    /// frontend must start from login screen. check statusCode == 426,
    return createResponse(HttpStatus.upgradeRequired, StatusMessage.statusFailed, 'Token is expired. You have to login');
  }
}
