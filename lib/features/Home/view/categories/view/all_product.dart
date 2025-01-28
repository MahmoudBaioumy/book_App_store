import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/categories/Widget/categroe_build_list.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/Allcategories_States.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/Allcategories_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
  late AllInfcubit allInfcubit;

  @override
  var name;
  @override
  void initState() {
    allInfcubit = AllInfcubit.get(context);
    allInfcubit.getid(id: widget.id);
    name = allInfcubit.model?.data?.name.toString();
    print('jnadkasnkmas$name');

    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    name = allInfcubit.model?.data?.name.toString();
    super.setState(fn);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            name.toString(),
            style: getTitelstyle(color: AppColor.bluecolor, fontSize: 20),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.bluecolor,
              )),
        ),
        body: BlocBuilder<AllInfcubit, AllcategoriesState>(
          builder: (context, state) {
            if (state is AllcategoriesSuccessState) {
              return SizedBox(
                width: double.infinity,
                child: ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    itemBuilder: (context, index) {
                      return categoriesWidget(
                        id: allInfcubit.model?.data?.products?[index].id ?? 0,
                        name: allInfcubit.model?.data?.products?[index].name ??
                            "",
                        Sallery:
                            allInfcubit.model?.data?.products?[index].price ??
                                "",
                        disscond: allInfcubit
                                .model?.data?.products?[index].discount
                                .toString() ??
                            "",
                        image:
                            allInfcubit.model?.data?.products?[index].image ??
                                "",
                        salarydiss: allInfcubit.model?.data?.products?[index]
                                .priceAfterDiscount
                                .toString() ??
                            "",
                        type: allInfcubit.model?.data?.products?[index].name ??
                            "",
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(10),
                    itemCount: allInfcubit.model?.data?.products?.length ?? 0),
              );
            }
            if (state is AllcategoriesLoadingState) {
              return Skeletonizer(
                enableSwitchAnimation: true,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return categoriesWidget(
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
                    itemCount: 17),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
