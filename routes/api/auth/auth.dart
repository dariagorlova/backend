import 'dart:io';

import 'package:backend/constants.dart';
import 'package:backend/repository/session/session_repository.dart';
import 'package:backend/utils/auth_header.dart';
import 'package:backend/utils/output_response.dart';
import 'package:backend/utils/request_method.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db_models/db_models.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  return requestMethod(context.request, HttpMethod.get) ??
      authHeader(context) ??
      await _isAuthenticated(context);
}

Future<Response> _isAuthenticated(RequestContext context) async {
  final token = context.request.headers[tokenHeaderName]!;
  final session = context.read<SessionRepository>();
  final id = session.getUserIdForToken(token);
  final database = context.read<Database>();
  final dbUser = await database.users.queryUser(id!);
  if (dbUser != null && dbUser.token == token) {
    return createResponse(HttpStatus.ok, StatusMessage.statusSuccess, StatusMessage.statusSuccess);
  }
  else {
    return createResponse(HttpStatus.ok, StatusMessage.statusSuccess, StatusMessage.statusFailed);
  }
}