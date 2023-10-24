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
  return requestMethod(context.request, HttpMethod.get) ??
      authHeader(context) ??
      await _logout(context);
}

/// input:
/// token in header and empty body
Future<Response> _logout(RequestContext context) async {
  final token = context.request.headers['token']!;
  final session = context.read<SessionRepository>();
  final id = session.getUserIdForToken(token);
  final database = context.read<Database>();
  final updateRequest = db.UserUpdateRequest(id: id!, token: '');
  await database.users.updateOne(updateRequest);
  session.removeSession(token);
  return createResponse(HttpStatus.badRequest, StatusMessage.statusSuccess, 'Logout done');
}
