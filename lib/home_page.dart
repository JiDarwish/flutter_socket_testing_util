import 'package:flutter/material.dart';
import 'package:fluttersocket/socket_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final socketService = SocketService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            maxLines: 10,
            controller: _controller,
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              final query = _controller.text;
              print(query);
              socketService.send(query);
            },
          )
        ],
      ),
    );
  }
}
