import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/features/profile/view_model/cubit/cubit_profile_states.dart';
import 'package:flutter_application_2/features/profile/view_model/cubit/profile_cubit.dart';
import 'package:flutter_application_2/features/profile/view_model/profile_model.dart';
import 'package:flutter_application_2/features/profile/widgets/colum_profile_build.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    String? token = SharedPreferencHelper.getData(key: 'token');

    ProfileCubit.get(context).getprofile(token ?? "");
    super.initState();
  }

  ProfileModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: BlocConsumer<ProfileCubit, ProfileStates>(
              listener: (context, state) {
            if (state is ProfileSuccessState) {
              print(state.Model);
              setState(() {
                model = state.Model;
              });
            }
            if (state is ProfileErrorState) {
              print(state.error);
            }
          }, builder: (context, state) {
            print("state $state");
            if (state is ProfileSuccessState) {
              return ColumProfileBuild();
            }
            if (state is ProfileLoadingState) {
              return Skeletonizer(
                enableSwitchAnimation: true,
                child: ColumProfileBuild(),
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
