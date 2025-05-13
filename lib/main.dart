import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwachat/screens/HomeScreen.dart';
import 'package:pwachat/screens/registerScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'logic/auth_cubit.dart';
import 'logic/contacts_cubit.dart';
import 'logic/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://mwsflyusutdxyihuzdms.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13c2ZseXVzdXRkeHlpaHV6ZG1zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU0Mzg0NjQsImV4cCI6MjA2MTAxNDQ2NH0.MkJYqki-RZcLwBb5POUhiYEFPPB_xr_3sJj5SOAkW3Y",
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(),
    ),
    BlocProvider(create: (context) => ProfileCubit()),
    BlocProvider(create: (context) => ContactsCubit())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final subase = Supabase.instance.client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: subase.auth.currentUser == null ? RegisterScreen() : Homescreen(),
    );
  }
}
