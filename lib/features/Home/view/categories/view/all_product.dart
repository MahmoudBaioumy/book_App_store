import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/info_statets.dart';
import 'package:flutter_application_2/features/Home/view/categories/Widget/categroe_build_list.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/AllcategoriesModel%20.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/Allcategories_States.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/Allcategories_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Allproductinfo extends StatefulWidget {
  const Allproductinfo({
    super.key,
    required this.id,
  });
  final int id;
  @override
  State<Allproductinfo> createState() => _AllproductinfoState();
}

class _AllproductinfoState extends State<Allproductinfo> {
  @override
  @override
  void initState() {
    AllInfcubit.get(context).getid(id: widget.id);

    super.initState();
  }

  @override
  AllcategoriesModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllInfcubit, AllcategoriesState>(
      listener: (context, state) {
        if (state is AllcategoriesSuccessState) {
          setState(() {
            model = state.Model;
          });
        }
        if (state is AllcategoriesErrorState) {
          print(state.Error);
        }
      },
      builder: (context, state) {
        if (state is InfoSuccessState) {
          return SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return categoriesWidget(
                    id: model!.data!.products![index].id!,
                    name: model!.data!.products![index].name!,
                    Sallery: model!.data!.products![index].price!,
                    disscond: model!.data!.products![index].discount.toString(),
                    image: model!.data!.products![index].image!,
                    salarydiss: model!.data!.products![index].priceAfterDiscount
                        .toString(),
                    type: model!.data!.products![index].name!,
                  );
                },
                separatorBuilder: (context, index) => const Gap(10),
                itemCount: model!.data!.products!.length),
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
