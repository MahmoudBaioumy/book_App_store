import 'package:flutter/material.dart';

import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/newarrivals/data/cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/newarrivals/data/cubit/NewArrivals_states.dart';
import 'package:flutter_application_2/features/newarrivals/data/model/NewArrivals_model.dart';
import 'package:flutter_application_2/features/newarrivals/data/model/NewArrivals_model.dart';
import 'package:flutter_application_2/features/newarrivals/widgets/newarrivals_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../data/model/NewArrivals_model.dart';

class NewArrivalsView extends StatefulWidget {
  const NewArrivalsView({super.key});

  @override
  State<NewArrivalsView> createState() => _NewArrivalsViewState();
}

class _NewArrivalsViewState extends State<NewArrivalsView> {
  @override
  void initState() {
    NewArrivalsCubit.get(context).getNewArrivals();
    super.initState();
  }

  late NewArrivalsCubit newcubit = NewArrivalsCubit.get(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.bluecolor,
            )),
        title: Text(
          AppStrings.NewArrivalsTitel,
          style: getTitelstyle(color: AppColor.bluecolor, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
          builder: (context, state) {
            var data = newcubit.newarrivalsmodel?.data?.products ?? [];
            if (state is newarrivalsSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return NewArrival_list_Widget(
                            id: data[index].id ?? 0,
                            diss: data[index].discount.toString(),
                            salaryydiss:
                                data[index].priceAfterDiscount.toString(),
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
            if (state is newarrivalsloadingState) {
              return Skeletonizer(
                enableSwitchAnimation: true,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return NewArrival_list_Widget(
                        id: 1,
                        salaryydiss: 235.toString(),
                        diss: 30.toString(),
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
