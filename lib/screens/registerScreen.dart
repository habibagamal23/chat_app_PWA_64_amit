import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../logic/auth_cubit.dart';
import 'AddImageScreen.dart';
import 'HomeScreen.dart';
import 'Loginscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


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
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(state.message),
                  ),
                );
              }

              if (state is AuthSuccess) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Addimagescreen()));
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return CircularProgressIndicator();
              }
              return ElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().register(
                        emailController.text, passwordController.text, null);
                  },
                  child: Text("Register"));
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
              child: Text("go to Login"))
        ],
      ),
    );
  }
}
