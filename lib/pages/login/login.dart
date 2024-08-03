import 'package:flutter/material.dart';
import 'package:login_test/pages/login/components/forgot_pass.dart';
import 'package:login_test/pages/login/components/form.dart';
import 'package:login_test/pages/login/components/header_icon.dart';
import 'package:login_test/pages/login/components/login_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: media.height,
          width: media.width,
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/images/city_img.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: media.height * 0.82,
          width: media.width * 0.325,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0.8, 0.8),
                  colors: <Color>[
                    Color(0xFF7579ff),
                    Color(0xFFb224ef),
                  ])),
          child: Column(
            children: [
              const HeaderIcon(),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 0),
                child: const Column(
                  children: [
                    FormLogin(),
                    LoginButton(),
                    SizedBox(height: 90),
                    ForGotPassComponent(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
