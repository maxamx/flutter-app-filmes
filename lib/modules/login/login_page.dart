import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black45),
          Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
