import "package:freezed_annotation/freezed_annotation.dart";

part 'session_repository.freezed.dart';

/// here we'll collect all opened sessions for faster looking through
final openedSessions = <String, OnlineUser>{};

@Freezed()
/// dataclass for keeping the token and corresponding user_id
class OnlineUser with _$OnlineUser{
  /// constructor
  const factory OnlineUser({
    required int id,
  }) = _OnlineUser;
}

/// repository for middleware injection
class SessionRepository{
  /// add session to realtime storage
  void addSession(int id, String token){
    openedSessions[token] = OnlineUser(id: id);
  }

  /// get userID by token, if possible. otherwise null
  int? getUserIdForToken(String token){
    final session = openedSessions[token];
    return session?.id;
  }

  /// remove session on logout or account deletion
  void removeSession(String token){
    openedSessions.removeWhere((key, value) => key == token);
  }
}