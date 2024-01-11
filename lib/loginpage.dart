import 'package:flutter/material.dart';
import 'package:saumil_s_application/uihelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Column(children: [
        UiHelper.CustomTextField(emailController, "email", Icons.mail, false),
        UiHelper.CustomTextField(passwordController, "password", Icons.password, true),
        SizedBox(
          height: 30,
        ),
        UiHelper.CustomButton(() { }, "login"),
        SizedBox(
          height: 20,
        ),

      ],),
    );
  }
}
