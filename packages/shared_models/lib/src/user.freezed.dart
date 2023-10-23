// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_id')
  String get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  bool? get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_link')
  String? get emailVerificationLink => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'referal_code')
  String? get referalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_name') String userName,
      String email,
      @JsonKey(name: 'device_id') String deviceId,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      String? password,
      @JsonKey(name: 'email_verified') bool? emailVerified,
      @JsonKey(name: 'verification_link') String? emailVerificationLink,
      String? token,
      @JsonKey(name: 'referal_code') String? referalCode});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? email = null,
    Object? deviceId = null,
    Object? avatarUrl = freezed,
    Object? password = freezed,
    Object? emailVerified = freezed,
    Object? emailVerificationLink = freezed,
    Object? token = freezed,
    Object? referalCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerificationLink: freezed == emailVerificationLink
          ? _value.emailVerificationLink
          : emailVerificationLink // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      referalCode: freezed == referalCode
          ? _value.referalCode
          : referalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_name') String userName,
      String email,
      @JsonKey(name: 'device_id') String deviceId,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      String? password,
      @JsonKey(name: 'email_verified') bool? emailVerified,
      @JsonKey(name: 'verification_link') String? emailVerificationLink,
      String? token,
      @JsonKey(name: 'referal_code') String? referalCode});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? email = null,
    Object? deviceId = null,
    Object? avatarUrl = freezed,
    Object? password = freezed,
    Object? emailVerified = freezed,
    Object? emailVerificationLink = freezed,
    Object? token = freezed,
    Object? referalCode = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerificationLink: freezed == emailVerificationLink
          ? _value.emailVerificationLink
          : emailVerificationLink // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      referalCode: freezed == referalCode
          ? _value.referalCode
          : referalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id = -1,
      @JsonKey(name: 'user_name') this.userName = '',
      required this.email,
      @JsonKey(name: 'device_id') required this.deviceId,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      this.password,
      @JsonKey(name: 'email_verified') this.emailVerified,
      @JsonKey(name: 'verification_link') this.emailVerificationLink,
      this.token,
      @JsonKey(name: 'referal_code') this.referalCode});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  final String email;
  @override
  @JsonKey(name: 'device_id')
  final String deviceId;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? password;
  @override
  @JsonKey(name: 'email_verified')
  final bool? emailVerified;
  @override
  @JsonKey(name: 'verification_link')
  final String? emailVerificationLink;
  @override
  final String? token;
  @override
  @JsonKey(name: 'referal_code')
  final String? referalCode;

  @override
  String toString() {
    return 'User(id: $id, userName: $userName, email: $email, deviceId: $deviceId, avatarUrl: $avatarUrl, password: $password, emailVerified: $emailVerified, emailVerificationLink: $emailVerificationLink, token: $token, referalCode: $referalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.emailVerificationLink, emailVerificationLink) ||
                other.emailVerificationLink == emailVerificationLink) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.referalCode, referalCode) ||
                other.referalCode == referalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userName,
      email,
      deviceId,
      avatarUrl,
      password,
      emailVerified,
      emailVerificationLink,
      token,
      referalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final int id,
      @JsonKey(name: 'user_name') final String userName,
      required final String email,
      @JsonKey(name: 'device_id') required final String deviceId,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      final String? password,
      @JsonKey(name: 'email_verified') final bool? emailVerified,
      @JsonKey(name: 'verification_link') final String? emailVerificationLink,
      final String? token,
      @JsonKey(name: 'referal_code') final String? referalCode}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  String get email;
  @override
  @JsonKey(name: 'device_id')
  String get deviceId;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get password;
  @override
  @JsonKey(name: 'email_verified')
  bool? get emailVerified;
  @override
  @JsonKey(name: 'verification_link')
  String? get emailVerificationLink;
  @override
  String? get token;
  @override
  @JsonKey(name: 'referal_code')
  String? get referalCode;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
