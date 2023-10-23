import 'dart:convert';
import 'package:crypto/crypto.dart';

extension StringHash on String{
  /// password protection mechanism
  String get hashValue{
    return sha256.convert(utf8.encode(this)).toString();
  }

  /// base token generation. this = 'email|deviceId|password'
  String get baseToken{
    return base64Encode(utf8.encode(this));
  }
}