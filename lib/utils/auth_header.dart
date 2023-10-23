import 'dart:io';
import 'package:backend/repository/session/session_repository.dart';
import 'package:dart_frog/dart_frog.dart';

const _tokenHeaderName = 'token';

///
Response? authHeader(RequestContext context) {
  final token = context.request.headers[_tokenHeaderName];
  if (token == null) {
    return Response(
      statusCode: HttpStatus.unauthorized,
      body: 'Token is required.',
    );
  }

  final sessionRepo = context.read<SessionRepository>();
  final id = sessionRepo.getUserIdForToken(token);
  if (id == null){
    /// frontend must start from login screen. check statusCode == 426,
    return Response(
      statusCode: HttpStatus.upgradeRequired,
      body: 'Token is expired. You have to login',
    );
  }
  return null;
}