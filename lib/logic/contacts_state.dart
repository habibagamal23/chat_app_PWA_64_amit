part of 'contacts_cubit.dart';

@immutable
sealed class ContactsState {}

final class ContactsInitial extends ContactsState {}
final class ContactsLoading extends ContactsState {}
final class ContactsSuccess extends ContactsState {
  List<Profile> profiles;
  ContactsSuccess(this.profiles);
}
final class ContactsError extends ContactsState {
  String error;
  ContactsError(this.error);
}
