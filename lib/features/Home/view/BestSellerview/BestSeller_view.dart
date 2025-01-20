import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/buttom_nav/buttom_nav.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/BestSellerModel/bestseller_model.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/Home/widget/bestsallerwidget/BestSeller_home_ifo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class bestsellerview extends StatefulWidget {
  const bestsellerview({super.key});

  @override
  State<bestsellerview> createState() => _bestsellerviewState();
}

class _bestsellerviewState extends State<bestsellerview> {
  @override
  @override
  void initState() {
    homeCubit.get(context).getdata();
    super.initState();
  }

  BestSellerModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            push(context, const bottom_nav());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.bluecolor,
          ),
        ),
        title: Text(
          'Best Seller books',
          style: getTitelstyle(color: AppColor.bluecolor, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<homeCubit, homeStates>(
          listener: (context, state) {
            if (state is homeSuccessState) {
              setState(() {
                model = state.model;
              });
            }
            if (state is homeErrorState) {
              print(state.error);
            }
          },
          builder: (context, state) {
            if (state is homeSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Bestsellerhome(
                            id: model!.data!.products![index].id!,
                            salarydiss: model!
                                .data!.products![index].priceAfterDiscount!
                                .toString(),
                            disscond: model!.data!.products![index].discount!
                                .toString(),
                            image: model!.data!.products![index].image!,
                            name: model!.data!.products![index].name!,
                            type: model!.data!.products![index].category!,
                            Sallery: model!.data!.products![index].price!,
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(15),
                        itemCount: model!.data!.products!.length),
                  ),
                ],
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
        ),
      ),
    );
  }
}
