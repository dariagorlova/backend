import 'dart:io';
import 'package:backend/constants.dart';
import 'package:backend/repository/session/session_repository.dart';
import 'package:backend/utils/output_response.dart';
import 'package:dart_frog/dart_frog.dart';

///
Response? authHeader(RequestContext context) {
  final token = context.request.headers[tokenHeaderName];
  if (token == null) {
    return createResponse(HttpStatus.unauthorized, StatusMessage.statusFailed, 'Token is required');
  }

  final sessionRepo = context.read<SessionRepository>();
  final id = sessionRepo.getUserIdForToken(token);
  if (id == null){
    /// frontend must start from login screen. check statusCode == 426,
    return createResponse(HttpStatus.upgradeRequired, StatusMessage.statusFailed, 'Token is expired. You have to login');
  }
  return null;
}