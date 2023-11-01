import "package:freezed_annotation/freezed_annotation.dart";
import 'package:db_models/db_models.dart' as db;

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User implements db.UserView{
  const factory User({
    @Default(-1)  int id,
    @Default('')
    @JsonKey(name: 'user_name')  String userName,
    required String email,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? password,
    @JsonKey(name: 'email_verified') bool? emailVerified,
    @JsonKey(name: 'verification_link') String? emailVerificationLink,
    String? token,
    @JsonKey(name: 'referal_code') String? referalCode,
/// mb, social credentials...
}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromUserView(db.UserView user) => User(
    id: user.id,
    userName: user.userName,
    email:user.email,
    deviceId:user.deviceId,
    avatarUrl:user.avatarUrl,
    password:user.password,
    emailVerified:user.emailVerified,
    emailVerificationLink:user.emailVerificationLink,
    token:user.token,
    referalCode: user.referalCode,
  );
  
  factory User.empty()=>User(
    id: -1,
    userName: '',
    email: '',
    deviceId: '',
    avatarUrl: '',
    password: '',
    emailVerified: false,
    emailVerificationLink: '',
    token: '',
    referalCode: '',
  );
}

