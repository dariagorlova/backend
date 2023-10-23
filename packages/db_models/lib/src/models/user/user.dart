import 'package:stormberry/stormberry.dart';

part 'user.schema.dart';

@Model()
abstract class User {
  @PrimaryKey()
  @AutoIncrement()
  int get id;

  String get userName;
  String get email;
  String get deviceId;
  String? get avatarUrl;
  String? get password;
  bool? get emailVerified;
  String? get emailVerificationLink;
  String? get token;
  String? get referalCode;
}

