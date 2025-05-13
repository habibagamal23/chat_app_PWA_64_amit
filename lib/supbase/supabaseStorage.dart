import 'dart:io';

import 'package:pwachat/supbase/supbasedb.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'SupbaseAuth.dart';

class SupabaseStorage {
  final subabase = Supabase.instance.client;

  Future UploadImage(File file) async {
    try {
      String? id = SupbaseAuth().CurrentUserId;
      if (id == null) {
        throw Exception("User not logged in");
      }
      final path = 'users/${id}.png';
      await subabase.storage
          .from("images")
          .upload(path, file, fileOptions: FileOptions(upsert: true));
      print("upload successfully");

      final urlImage = subabase.storage.from("images").getPublicUrl(path);
      if (urlImage != null) {
        await upadateProfileImage(urlImage, id);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> upadateProfileImage(String url, String userId) async {
    try {
      await subabase
          .from("profilesusers")
          .update({"avatar_url": url}).eq('id', userId);
      print("update successfully");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
