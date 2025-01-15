import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/fav/model/cubit/fav_cubit.dart';
import 'package:flutter_application_2/features/fav/model/cubit/fav_states.dart';
import 'package:flutter_application_2/features/fav/model/favModel.dart';
import 'package:flutter_application_2/features/fav/widget/favBuilder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class fav_view extends StatefulWidget {
  const fav_view({super.key, required this.id, required this.token});

  @override
  @override
  final int id;
  final String token;
  @override
  @override
  State<fav_view> createState() => _fav_viewState();
}

class _fav_viewState extends State<fav_view> {
  @override
  void initState() {
    super.initState();
    favcubit.get(context).addfav(id: widget.id, token: widget.token);
  }

  favModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favcubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<favcubit, favStates>(
                  listener: (context, state) {
                    if (state is favSuccessState) {
                      setState(() {
                        model = state.Model;
                      });
                    }
                    if (state is favErrorState) {
                      print(state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is favSuccessState) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return  favBuilder(
                              image: model!.data!.currentPage!.toString(),
                              name: 'system devvvv',
                              type: 'software',
                              price: '200.00 LE',
                              priceafterdis: '156.00 LE',
                            );
                          },
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: 5);
                    }
                    if (state is favoLoadingState) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColor.bluecolor,
                      ));
                    }
                    return const SizedBox();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
