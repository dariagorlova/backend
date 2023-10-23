import 'package:backend/repository/session/session_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
import 'package:stormberry/stormberry.dart';

Handler middleware(Handler handler) {
  final dotEnv = DotEnv(includePlatformEnvironment: true)..load(['.env']);

  final session = SessionRepository();
  final db = Database(
    host: dotEnv.getOrElse(
      'POSTGRES_HOST',
          () => throw Exception('HOST not defined'),
    ),
    port: int.parse(dotEnv.getOrElse(
      'POSTGRES_PORT',
          () => throw Exception('PORT not defined'),
    )),
    database: dotEnv.getOrElse(
      'POSTGRES_DB',
          () => throw Exception('DB not defined'),
    ),
    user: dotEnv.getOrElse(
      'POSTGRES_USER',
          () => throw Exception('USER not defined'),
    ),
    password: dotEnv.getOrElse(
      'POSTGRES_PASSWORD',
          () => throw Exception('PASSWORD not defined'),
    ),
    // for local debug only
    useSSL: false,
    // for local debug only
    isUnixSocket: false,
  );

  return handler
      // console log
      .use(requestLogger())
      // token
      .use(provider<SessionRepository>((_)=>SessionRepository()))
      // database
      .use(provider<Database>((_) =>db),
      );
}
