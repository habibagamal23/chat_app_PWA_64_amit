import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pwachat/supbase/SupbaseAuth.dart';
import 'package:pwachat/supbase/supbasedb.dart';

import '../model/profilemodel.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  String id = SupbaseAuth().CurrentUserId ?? "no id";

  getProfile() async {
    emit(ProfileLoading());
    try {
      final user = await SupbaseDb().getUserProfile(id);
      emit(ProfileSuccess(user));
    } catch (e) {
      // error message
      emit(ProfileError(e.toString()));
    }
  }
}
