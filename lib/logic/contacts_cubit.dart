import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pwachat/model/profilemodel.dart';
import 'package:pwachat/supbase/supbasedb.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(ContactsInitial());
  showAllContcts() async {
    emit(ContactsLoading());
    try {
      final contacts = await SupbaseDb().getallProfile();
      emit(ContactsSuccess(contacts));
    } catch (e) {
      emit(ContactsError(e.toString()));
    }
  }
}
