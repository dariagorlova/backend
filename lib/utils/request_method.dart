import 'dart:io';
import 'package:backend/constants.dart';
import 'package:backend/utils/output_response.dart';
import 'package:dart_frog/dart_frog.dart';

Response? requestMethod(Request request, HttpMethod method) {
  if (request.method != method) {
    return createResponse(HttpStatus.methodNotAllowed, StatusMessage.statusFailed, 'Only ${method.value} method is allowed.');
  }

  return null;
}