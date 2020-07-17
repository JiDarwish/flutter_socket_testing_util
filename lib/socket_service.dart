import 'dart:async' show Timer;

import 'package:fluttersocket/config.dart';
import 'package:websocket_manager/websocket_manager.dart' show WebsocketManager;

class SocketService {
  final socket = WebsocketManager(Config.url, {'Authorization': Config.token});

  Timer timer;

  SocketService() {
    socket.connect().then((value) {
      this._registerTimer();
      this._registerMessageListener();
    });
  }

  _registerMessageListener() {
    socket.onMessage((msg) {
      print('Received message $msg');
    });
  }

  _registerTimer() {
    // Timer.periodic(Duration(seconds: 2), (timer) {
    socket.send('''
        {
          "type": "USER_LOCATION_UPDATE",
          "lng": 12.3,
          "lat": 23.4
        }
      ''');
    // });
  }

  send(String jsonMsg) {
    socket.send(jsonMsg);
  }
}
