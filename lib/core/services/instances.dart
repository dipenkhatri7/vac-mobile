import 'package:get_it/get_it.dart';
import 'package:socket_io_client/socket_io_client.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(() => io(
        'http://localhost:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build(),
      ));
}
