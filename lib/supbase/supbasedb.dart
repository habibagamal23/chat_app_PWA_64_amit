import 'package:pwachat/model/profilemodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupbaseDb {
  // object from supabse instance
  final supbase = Supabase.instance.client;

  Future insertProfile(Profile profile) async {
    try {
      await supbase.from('profilesusers').insert(profile.toMap());
      print("Insert Successfully");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // how too get user profile
  Future<Profile> getUserProfile(String id) async {
    try {
      final userProfile =
          await supbase.from('profilesusers').select().eq('id', id).single();
      print("Get User Profile Successfully");
      return Profile.fromMap(userProfile);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  //how to get all profiles

  Future<List<Profile>> getallProfile() async {
    try {
      final profiles = await supbase.from('profilesusers').select();
      return profiles.map((e) => Profile.fromMap(e)).toList();
      print("Get All Profiles Successfully");
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}
