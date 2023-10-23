// ignore_for_file: annotate_overrides

part of 'user.dart';

extension UserRepositories on Database {
  UserRepository get users => UserRepository._(this);
}

abstract class UserRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<UserInsertRequest>,
        ModelRepositoryUpdate<UserUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory UserRepository._(Database db) = _UserRepository;

  Future<UserView?> queryUser(int id);
  Future<List<UserView>> queryUsers([QueryParams? params]);
}

class _UserRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<UserInsertRequest>,
        RepositoryUpdateMixin<UserUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements UserRepository {
  _UserRepository(super.db) : super(tableName: 'users', keyName: 'id');

  @override
  Future<UserView?> queryUser(int id) {
    return queryOne(id, UserViewQueryable());
  }

  @override
  Future<List<UserView>> queryUsers([QueryParams? params]) {
    return queryMany(UserViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<UserInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.query(
      'INSERT INTO "users" ( "user_name", "email", "device_id", "avatar_url", "password", "email_verified", "email_verification_link", "token", "referal_code" )\n'
      'VALUES ${requests.map((r) => '( ${values.add(r.userName)}:text, ${values.add(r.email)}:text, ${values.add(r.deviceId)}:text, ${values.add(r.avatarUrl)}:text, ${values.add(r.password)}:text, ${values.add(r.emailVerified)}:boolean, ${values.add(r.emailVerificationLink)}:text, ${values.add(r.token)}:text, ${values.add(r.referalCode)}:text )').join(', ')}\n'
      'RETURNING "id"',
      values.values,
    );
    var result = rows.map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id'])).toList();

    return result;
  }

  @override
  Future<void> update(List<UserUpdateRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.query(
      'UPDATE "users"\n'
      'SET "user_name" = COALESCE(UPDATED."user_name", "users"."user_name"), "email" = COALESCE(UPDATED."email", "users"."email"), "device_id" = COALESCE(UPDATED."device_id", "users"."device_id"), "avatar_url" = COALESCE(UPDATED."avatar_url", "users"."avatar_url"), "password" = COALESCE(UPDATED."password", "users"."password"), "email_verified" = COALESCE(UPDATED."email_verified", "users"."email_verified"), "email_verification_link" = COALESCE(UPDATED."email_verification_link", "users"."email_verification_link"), "token" = COALESCE(UPDATED."token", "users"."token"), "referal_code" = COALESCE(UPDATED."referal_code", "users"."referal_code")\n'
      'FROM ( VALUES ${requests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.userName)}:text::text, ${values.add(r.email)}:text::text, ${values.add(r.deviceId)}:text::text, ${values.add(r.avatarUrl)}:text::text, ${values.add(r.password)}:text::text, ${values.add(r.emailVerified)}:boolean::boolean, ${values.add(r.emailVerificationLink)}:text::text, ${values.add(r.token)}:text::text, ${values.add(r.referalCode)}:text::text )').join(', ')} )\n'
      'AS UPDATED("id", "user_name", "email", "device_id", "avatar_url", "password", "email_verified", "email_verification_link", "token", "referal_code")\n'
      'WHERE "users"."id" = UPDATED."id"',
      values.values,
    );
  }
}

class UserInsertRequest {
  UserInsertRequest({
    required this.userName,
    required this.email,
    required this.deviceId,
    this.avatarUrl,
    this.password,
    this.emailVerified,
    this.emailVerificationLink,
    this.token,
    this.referalCode,
  });

  final String userName;
  final String email;
  final String deviceId;
  final String? avatarUrl;
  final String? password;
  final bool? emailVerified;
  final String? emailVerificationLink;
  final String? token;
  final String? referalCode;
}

class UserUpdateRequest {
  UserUpdateRequest({
    required this.id,
    this.userName,
    this.email,
    this.deviceId,
    this.avatarUrl,
    this.password,
    this.emailVerified,
    this.emailVerificationLink,
    this.token,
    this.referalCode,
  });

  final int id;
  final String? userName;
  final String? email;
  final String? deviceId;
  final String? avatarUrl;
  final String? password;
  final bool? emailVerified;
  final String? emailVerificationLink;
  final String? token;
  final String? referalCode;
}

class UserViewQueryable extends KeyedViewQueryable<UserView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query => 'SELECT "users".*'
      'FROM "users"';

  @override
  String get tableAlias => 'users';

  @override
  UserView decode(TypedMap map) => UserView(
      id: map.get('id'),
      userName: map.get('user_name'),
      email: map.get('email'),
      deviceId: map.get('device_id'),
      avatarUrl: map.getOpt('avatar_url'),
      password: map.getOpt('password'),
      emailVerified: map.getOpt('email_verified'),
      emailVerificationLink: map.getOpt('email_verification_link'),
      token: map.getOpt('token'),
      referalCode: map.getOpt('referal_code'));
}

class UserView {
  UserView({
    required this.id,
    required this.userName,
    required this.email,
    required this.deviceId,
    this.avatarUrl,
    this.password,
    this.emailVerified,
    this.emailVerificationLink,
    this.token,
    this.referalCode,
  });

  final int id;
  final String userName;
  final String email;
  final String deviceId;
  final String? avatarUrl;
  final String? password;
  final bool? emailVerified;
  final String? emailVerificationLink;
  final String? token;
  final String? referalCode;
}
