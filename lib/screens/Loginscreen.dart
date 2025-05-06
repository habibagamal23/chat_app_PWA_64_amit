import 'package:flutter/material.dart';

import '../supbase/supbaseAuth.dart';


class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await SupbaseAuth()
                    .SingIn(emailController.text, passwordController.text);
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
