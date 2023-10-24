import 'dart:io';

import 'package:backend/constants.dart';
import 'package:backend/utils/output_response.dart';
import 'package:backend/utils/request_method.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/stormberry.dart';
import 'package:db_models/db_models.dart' as db;

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  return requestMethod(context.request, HttpMethod.get) ??
      await _verification(context, id);
}

Future<Response> _verification(RequestContext context, String id) async {
  final database = context.read<Database>();
  // better to use database.users.query(), but i don't know how
  final rawResult = await database.query("SELECT * FROM users WHERE email_verification_link = '$id'");
  if (rawResult.length != 1){
    return createResponse(HttpStatus.badRequest, StatusMessage.statusFailed, 'User not found');
  }

  final userId = rawResult.first.toColumnMap()['id'] as int;
  final updateRequest = db.UserUpdateRequest(
    id: userId,
    emailVerified: true,
    emailVerificationLink: '',
  );
  await database.users.updateOne(updateRequest);
  //TODO: mb we have to return a full user for autologin if needed
  return createResponse(HttpStatus.ok, StatusMessage.statusSuccess, 'Email verified');
}
