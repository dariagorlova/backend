import 'dart:io';

import 'package:backend/extensions/string_hash_extension.dart';
import 'package:backend/utils/output_response.dart';
import 'package:backend/utils/request_method.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:db_models/db_models.dart' as db;
import 'package:shared_models/shared_models.dart' as shared;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  return requestMethod(context.request, HttpMethod.post) ??
      await _signUp(context);
}

Future<Response> _signUp(RequestContext context) async{
  final body = await context.request.json() as Map<String, dynamic>;
  shared.User? inUser;
  try { // if some shit as "user" was sent to this entryPoint
    inUser = shared.User.fromJson(body);
  }catch (e){
    return createResponse(HttpStatus.badRequest, 'failed', 'Invalid syntax in request');
  }

  final database = context.read<Database>();
  final users = await database.users.queryUsers();

  for (final u in users) {
    if (u.email == inUser.email) {
      return createResponse(HttpStatus.badRequest, 'failed', 'email ${inUser.email} is already taken!');
    }
  }

  final request = db.UserInsertRequest(
    userName: inUser.userName,
    email: inUser.email,
    deviceId: inUser.deviceId,
    avatarUrl: inUser.avatarUrl,
    password: inUser.password?.hashValue,
    emailVerified: false,
    emailVerificationLink: inUser.email.hashValue,
    token: '',
    referalCode: inUser.referalCode,
  );
  final id = await database.users.insertOne(request);

  inUser = inUser.copyWith(id: id);
  //TODO: send verification email
  print('verify/${inUser.emailVerificationLink}');

  return createResponse(HttpStatus.created, 'success', 'User was created', inUser.toJson(),);// logic here
}
