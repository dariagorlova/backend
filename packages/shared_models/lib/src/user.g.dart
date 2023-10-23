// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int? ?? -1,
      userName: json['user_name'] as String? ?? '',
      email: json['email'] as String,
      deviceId: json['device_id'] as String,
      avatarUrl: json['avatar_url'] as String?,
      password: json['password'] as String?,
      emailVerified: json['email_verified'] as bool?,
      emailVerificationLink: json['verification_link'] as String?,
      token: json['token'] as String?,
      referalCode: json['referal_code'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'email': instance.email,
      'device_id': instance.deviceId,
      'avatar_url': instance.avatarUrl,
      'password': instance.password,
      'email_verified': instance.emailVerified,
      'verification_link': instance.emailVerificationLink,
      'token': instance.token,
      'referal_code': instance.referalCode,
    };
