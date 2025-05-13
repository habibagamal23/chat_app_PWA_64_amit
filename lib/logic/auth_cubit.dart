import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:pwachat/model/profilemodel.dart';

import '../supbase/supbaseAuth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  register(String email, String password, File? avatarFile) async {
    emit(AuthLoading());
    try {
      await SupbaseAuth().registerUser(email, password, avatarFile);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
