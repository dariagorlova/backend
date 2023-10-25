import 'dart:io';

import 'package:backend/constants.dart';
import 'package:backend/extensions/string_hash_extension.dart';
import 'package:backend/utils/output_response.dart';
import 'package:backend/utils/request_method.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db_models/db_models.dart' as db;
import 'package:email_sender/email_sender.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  return requestMethod(context.request, HttpMethod.post) ??
      await _signUp(context);
}

/// input: {
/// "user_name": "userrrr",
/// "email": "user@email.com",
/// "password": "password",
/// "deviceId": "UUID of device",
/// "referal_code": "" - can be absent in request
/// }
Future<Response> _signUp(RequestContext context) async{
  try {
    final body = await context.request.json() as Map<String, dynamic>;
    final inPassword = (body['password'] as String).hashValue;
    final inEmail = body['email'] as String;
    final inDeviceId = body['device_id'] as String;
    final inUserName = body['user_name'] as String;
    final inReferalCode = body['referal_code'] as String?;

    final database = context.read<Database>();
    final users = await database.users.queryUsers();

    for (final u in users) {
      if (u.email == inEmail) {
        return createResponse(HttpStatus.badRequest, StatusMessage.statusFailed,
            'email ${inEmail} is already taken!');
      }
    }

    final request = db.UserInsertRequest(
      userName: inUserName,
      email: inEmail,
      deviceId: inDeviceId,
      avatarUrl: '',
      password: inPassword,
      emailVerified: false,
      emailVerificationLink: inEmail.hashValue,
      token: '',
      referalCode: inReferalCode,
    );
    //final id = await database.users.insertOne(request);
    await database.users.insertOne(request);

    var outMessage = 'User was created';
    //->send verification email
    final emailSender = EmailSender();
    final res = await emailSender.sendMessage(
      inEmail,
      'Email verification',
      'Please confirm your email',
      'To confirm your email visit: http://localhost:8080/api/auth/verify/${inEmail.hashValue}',
    );

    if (res['message'] == 'emailSendSuccess') {
      outMessage = 'Confirmation email was sent';
    }
    //<-
    return createResponse(HttpStatus.created, StatusMessage.statusSuccess, outMessage);
  }catch(_){
    return createResponse(HttpStatus.badRequest, StatusMessage.statusFailed, 'Invalid syntax in request');
  }
}
