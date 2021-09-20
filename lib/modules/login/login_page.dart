import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
          Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}
