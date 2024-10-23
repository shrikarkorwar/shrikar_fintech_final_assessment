import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shrikar_fintech_final_assessment/helpers/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Column(
        children: [
          Text('Login Screen Body here'),
          ElevatedButton(onPressed: () {
            context.go(RouteNames.dashboard.path());
          }, child: Text('Go To dashboard'))
        ],
      ),
    );
  }
}