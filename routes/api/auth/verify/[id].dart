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
  final queryUsers = await database.users.queryUsers(
    QueryParams(
      where: 'email_verification_link=@email_verification_link',
      values: {'email_verification_link': id},
    ),
  );

  if (queryUsers.length != 1) {
    return createResponse(HttpStatus.badRequest, StatusMessage.statusFailed, 'User not found');
  }

  final updateRequest = db.UserUpdateRequest(
    id: queryUsers.first.id,
    emailVerified: true,
    emailVerificationLink: '',
  );
  await database.users.updateOne(updateRequest);
  //TODO: mb we have to return a full user for autologin if needed
  return createResponse(HttpStatus.ok, StatusMessage.statusSuccess, 'Email verified');
}
