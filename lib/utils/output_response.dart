import 'package:dart_frog/dart_frog.dart';

Response createResponse(int statusCode, String status, String message, [Map<String, dynamic>? json,]) {
  return json != null ?
  Response.json(statusCode: statusCode, body: {'status': status, 'message': message, 'data': json},) :
  Response.json(statusCode: statusCode, body: {'status': status, 'message': message,},
  );
}