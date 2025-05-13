import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pwachat/supbase/supbasedb.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/profilemodel.dart';
import 'SupbaseAuth.dart';

class SupbaseAuth {
  final supabase = Supabase.instance.client;

  String? get CurrentUserId {
    return supabase.auth.currentUser!.id;
  }
  Future  logout() async {
    await supabase.auth.signOut();
  }

  Future registerUser(String email, String password, File? urlimage) async {
    try {
      final AuthResponse response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      print(response.user);
      print("SignUp Successfully");
      if (response.user != null) {
        Profile profile = Profile(
            id: response.user!.id,
            username: "no username",
            email: email,
            phone: "02737363",
            avatar_url: null);

        await SupbaseDb().insertProfile(profile);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future SingIn(String email, String password) async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      print(response.user);
      print("Login Successfully");
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}
