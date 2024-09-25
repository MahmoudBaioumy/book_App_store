import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/BuildMoreInfo.dart';
import 'package:flutter_application_2/features/Home/view_model/BestSellerModel/bestseller_model.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/BestSeller_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class moreinfo extends StatefulWidget {
  const moreinfo({super.key});

  @override
  State<moreinfo> createState() => _moreinfoState();
}

class _moreinfoState extends State<moreinfo> {
  @override
  void initState() {
    homeCubit.get(context).getdata();
    super.initState();
  }

  BestSellerModel model = BestSellerModel();
 late int index;
  @override

   
  
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {
        if (state is homeSuccessState) {
          print(state.model);
          setState(() {
            model = state.model!;
          });
        }
        if (state is homeErrorState) {
          print(state.error);
        }
      },
      builder: (context, state) {
        if (state is homeSuccessState) {
          return Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(top: 40),
                
                child: BuildMoreInfo(
                  id: model.data!.products![index].id!,
                  image: model.data!.products![index].image!,
                  name: model.data!.products![index].name!,
                  type: model.data!.products![index].category!,
                  salary: model.data!.products![index].price!,
                  Description: model.data!.products![index].description!,
                )),
          );
        }
        if (state is homeLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColor.bluecolor,
          ));
        }
        return const SizedBox();
      },
    );
  }
}
