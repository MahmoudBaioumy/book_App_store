import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/categories/Widget/categroe_list_view.dart';
import 'package:flutter_application_2/features/categories/data/cubit/categories_States.dart';
import 'package:flutter_application_2/features/categories/data/cubit/categories_cubit.dart';
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
  late CategoriesCubit allcategorie;

  @override
  void initState() {
    allcategorie = CategoriesCubit.get(context);
    allcategorie.GetAcategoiresById(id: widget.id);

    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CategoriesCubit, categoriesState>(
            builder: (context, state) {
          if (state is AllcategoriesSuccessState) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    allcategorie.Model?.data?.name ?? '',
                    style:
                        getTitelstyle(color: AppColor.bluecolor, fontSize: 20),
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
                body: (SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      itemBuilder: (context, index) {
                        return CategroeListView(
                          id: allcategorie.Model?.data?.products?[index].id ??
                              0,
                          name:
                              allcategorie.Model?.data?.products?[index].name ??
                                  "",
                          Sallery: allcategorie
                                  .Model?.data?.products?[index].price ??
                              "",
                          disscond: allcategorie
                                  .Model?.data?.products?[index].discount
                                  .toString() ??
                              "",
                          image: allcategorie
                                  .Model?.data?.products?[index].image ??
                              "",
                          salarydiss: allcategorie.Model?.data?.products?[index]
                                  .priceAfterDiscount
                                  .toString() ??
                              "",
                          type:
                              allcategorie.Model?.data?.products?[index].name ??
                                  "",
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount:
                          allcategorie.Model?.data?.products?.length ?? 0),
                )));
          }
          if (state is AllcategoriesLoadingState) {
            return Skeletonizer(
                enableSwitchAnimation: true,
                child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        allcategorie.Model?.data?.name ?? '',
                        style: getTitelstyle(
                            color: AppColor.bluecolor, fontSize: 20),
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
                    body: (SizedBox(
                      width: double.infinity,
                      child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          itemBuilder: (context, index) {
                            return CategroeListView(
                              id: allcategorie
                                      .Model?.data?.products?[index].id ??
                                  0,
                              name: allcategorie
                                      .Model?.data?.products?[index].name ??
                                  "",
                              Sallery: allcategorie
                                      .Model?.data?.products?[index].price ??
                                  "",
                              disscond: allcategorie
                                      .Model?.data?.products?[index].discount
                                      .toString() ??
                                  "",
                              image: allcategorie
                                      .Model?.data?.products?[index].image ??
                                  "",
                              salarydiss: allcategorie.Model?.data
                                      ?.products?[index].priceAfterDiscount
                                      .toString() ??
                                  "",
                              type: allcategorie
                                      .Model?.data?.products?[index].name ??
                                  "",
                            );
                          },
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount:
                              allcategorie.Model?.data?.products?.length ?? 0),
                    ))));
          }
          return const SizedBox();
        }));
  }
}
