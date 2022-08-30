// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/screens/home_page_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bgColor = Color.fromARGB(255, 186, 247, 247);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pushNamed(HomePage.routeName);
            Navigator.pushNamed(context, HomePage.routeName);
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
