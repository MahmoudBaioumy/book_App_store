import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/BuildMoreInfo.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/Info_Cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/info_statets.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/info_bestseller/Info_Model/Info_Model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class moreinfo extends StatefulWidget {
  const moreinfo({
    super.key,
    required this.id,
  });
  final int id;
  @override
  State<moreinfo> createState() => _moreinfoState();
}

class _moreinfoState extends State<moreinfo> {
  @override
  @override
  void initState() {
    Infcubit.get(context).getid(id: widget.id);

    super.initState();
  }

  @override
  InfoModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Infcubit, infoStates>(
      listener: (context, state) {
        if (state is InfoSuccessState) {
          setState(() {
            model = state.Model;
          });
        }
        if (state is InfoErrorState) {
          print(state.error);
        }
      },
      builder: (context, state) {
        if (state is InfoSuccessState) {
          return Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: BuildMoreInfo(
                  image: model!.data!.image!,
                  name: model!.data!.name!,
                  type: model!.data!.category!,
                  salary: model!.data!.price!,
                  discound: model!.data!.priceAfterDiscount!.toString(),
                  Description: model!.data!.description!,
                )),
          );
        }
        if (state is InfoLoadingState) {
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
