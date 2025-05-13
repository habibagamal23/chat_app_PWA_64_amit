import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwachat/logic/profile_cubit.dart';
import 'package:pwachat/screens/Loginscreen.dart';
import 'package:pwachat/supbase/supbaseAuth.dart';

class ProfleScreen extends StatefulWidget {
  const ProfleScreen({super.key});

  @override
  State<ProfleScreen> createState() => _ProfleScreenState();
}

class _ProfleScreenState extends State<ProfleScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my profile"),
        actions: [
          IconButton(
              onPressed: () async {
                await SupbaseAuth().logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProfileError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is ProfileSuccess) {
          return Column(
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("${state.profile.avatar_url}")),
              Text("username :${state.profile.username}"),
              Text("email :${state.profile.email}"),
              Text("phone :${state.profile.phone}"),
            ],
          );
        }

        return Center(
          child: Text("no data"),
        );
      }),
    );
  }
}
