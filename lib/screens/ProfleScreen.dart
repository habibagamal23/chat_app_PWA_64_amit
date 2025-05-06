import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pwachat/logic/profile_cubit.dart';

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
