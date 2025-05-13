part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  Profile profile;
  ProfileSuccess(this.profile);
}

final class ProfileError extends ProfileState {
  String error;
  ProfileError(this.error);
}
