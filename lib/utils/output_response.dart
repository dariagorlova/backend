import 'package:dart_frog/dart_frog.dart';

Response createResponse(int statusCode, String status, String message, [Map<String, dynamic>? json,]) => Response.json(
  statusCode: statusCode,
  body: {
    'status': status,
    'message': message,
    'data': json,
  },
);
