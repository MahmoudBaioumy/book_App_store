import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/NewArrivalsmodel/NewArrivals_model.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/cubit/NewArrivals_cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/cubit/NewArrivals_cubit/NewArrivals_states.dart';
import 'package:flutter_application_2/features/Home/widget/NewArrivalswidget/NewArrivals_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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

  NewArrivalsmodel Model = NewArrivalsmodel();
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
          'New Arrivals Books',
          style: getTitelstyle(color: AppColor.bluecolor, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<NewArrivalsCubit, NewArrivalsState>(
          listener: (context, state) {
            if (state is newarrivalsSuccessState) {
              print(state.Model);
              setState(() {
                Model = state.Model!;
              });
            }
            if (state is newarrivalsErrorState) {
              print(state.error);
            }
          },
          builder: (context, state) {
            if (state is newarrivalsSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return NewArrivals_widget(
                            id: Model.data!.products![index].id!,
                            diss: Model.data!.products![index].discount!
                                .toString(),
                            salaryydiss: Model
                                .data!.products![index].priceAfterDiscount!
                                .toString(),
                            image: Model.data!.products![index].image!,
                            name: Model.data!.products![index].name!,
                            type: Model.data!.products![index].category!,
                            Sallery: Model.data!.products![index].price!,
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(15),
                        itemCount: Model.data!.products!.length),
                  ),
                ],
              );
            }
            if (state is newarrivalsloadingState) {
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
