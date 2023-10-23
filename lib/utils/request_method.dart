import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

Response? requestMethod(Request request, HttpMethod method) {
  if (request.method != method) {
    return Response(
      statusCode: HttpStatus.methodNotAllowed,
      body: 'Only ${method.value} method is allowed.',
    );
  }

  return null;
}