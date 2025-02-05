import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/bestseller/widgets/bestseller_list.dart';
import 'package:flutter_application_2/features/buttom_nav/view/buttom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class bestsellerview extends StatefulWidget {
  const bestsellerview({super.key});

  @override
  State<bestsellerview> createState() => _bestsellerviewState();
}

class _bestsellerviewState extends State<bestsellerview> {
  @override
  void initState() {
    homeCubit.get(context).getdata();
    super.initState();
  }

  late homeCubit cubit = homeCubit.get(context);
  final bool _enabled = true;
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
          AppStrings.BestSellerTitel,
          style: getTitelstyle(color: AppColor.bluecolor, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<homeCubit, homeStates>(
          builder: (context, state) {
            if (state is homeSuccessState) {
              var data = cubit.bestSellerModel?.data?.products ?? [];
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return BestsellerList(
                            id: data[index].id ?? 0,
                            salarydiss:
                                data[index].priceAfterDiscount.toString(),
                            disscond: data[index].discount.toString(),
                            image: data[index].image ?? '',
                            name: data[index].name ?? '',
                            type: data[index].category ?? '',
                            Sallery: data[index].price ?? '',
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(15),
                        itemCount: data.length),
                  ),
                ],
              );
            }
            if (state is homeLoadingState) {
              return Skeletonizer(
                enableSwitchAnimation: true,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return BestsellerList(
                        id: 1,
                        salarydiss: 235.toString(),
                        disscond: 30.toString(),
                        image:
                            'https://pngimg.com/uploads/book/book_PNG51041.png',
                        name: 'Hands-On-Machineleading',
                        type: 'Software',
                        Sallery: 400.toString(),
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(15),
                    itemCount: 15),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
