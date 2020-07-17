import 'dart:async' show Timer;

import 'package:websocket_manager/websocket_manager.dart' show WebsocketManager;

class SocketService {
  final socket = WebsocketManager('ws://10.0.2.2:3000/socket', {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZWU4ZjA0N2NhMWNmZDAwMjM3NzIwYjciLCJpYXQiOjE1OTQyNTYxNzMsImV4cCI6MTU5Njg0ODE3M30.ljKkFrmsTeWirfhsd2e8Kbu-IPHhH0o_ZH6ST8dHuMk'
  });

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
