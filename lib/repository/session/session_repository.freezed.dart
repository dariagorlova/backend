// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnlineUser {
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlineUserCopyWith<OnlineUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineUserCopyWith<$Res> {
  factory $OnlineUserCopyWith(
          OnlineUser value, $Res Function(OnlineUser) then) =
      _$OnlineUserCopyWithImpl<$Res, OnlineUser>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$OnlineUserCopyWithImpl<$Res, $Val extends OnlineUser>
    implements $OnlineUserCopyWith<$Res> {
  _$OnlineUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnlineUserImplCopyWith<$Res>
    implements $OnlineUserCopyWith<$Res> {
  factory _$$OnlineUserImplCopyWith(
          _$OnlineUserImpl value, $Res Function(_$OnlineUserImpl) then) =
      __$$OnlineUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$OnlineUserImplCopyWithImpl<$Res>
    extends _$OnlineUserCopyWithImpl<$Res, _$OnlineUserImpl>
    implements _$$OnlineUserImplCopyWith<$Res> {
  __$$OnlineUserImplCopyWithImpl(
      _$OnlineUserImpl _value, $Res Function(_$OnlineUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$OnlineUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnlineUserImpl implements _OnlineUser {
  const _$OnlineUserImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'OnlineUser(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineUserImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineUserImplCopyWith<_$OnlineUserImpl> get copyWith =>
      __$$OnlineUserImplCopyWithImpl<_$OnlineUserImpl>(this, _$identity);
}

abstract class _OnlineUser implements OnlineUser {
  const factory _OnlineUser({required final int id}) = _$OnlineUserImpl;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$OnlineUserImplCopyWith<_$OnlineUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
