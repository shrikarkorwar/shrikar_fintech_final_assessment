import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shrikar_fintech_final_assessment/helpers/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingController =
      TextEditingController(text: 'Enter username');
  final TextEditingController passwordTextController =
      TextEditingController(text: 'Enter Password');
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Form(
          key: globalKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: 'Enter Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                    validator: (value) {
                      if (value == "finance") {
                        return null;
                      } else {
                        return 'Wrong username';
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: passwordTextController,
                  decoration: InputDecoration(
                        hintText: 'Enter Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                  validator: (value) {
                    if (value == "12345678") {
                      return null;
                    } else {
                      return 'Wrong password';
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      context.go(RouteNames.dashboard.path());
                    }
                  },
                  child: Text('Go To dashboard'))
            ],
          )),
    );
  }
}
