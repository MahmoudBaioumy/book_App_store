import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/widgets/home_header.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/bestseller/view/BestSeller_view.dart';
import 'package:flutter_application_2/features/bestseller/view/bestseller_viewmodel.dart';
import 'package:flutter_application_2/features/bestseller/widgets/bestseller_info.dart';
import 'package:flutter_application_2/features/categories/Widget/maincategories.dart';
import 'package:flutter_application_2/features/categories/data/cubit/categories_States.dart';
import 'package:flutter_application_2/features/categories/data/cubit/categories_cubit.dart';
import 'package:flutter_application_2/features/categories/data/model/Categori_Model.dart';
import 'package:flutter_application_2/features/categories/view/home_view/categoeir_view_model.dart';
import 'package:flutter_application_2/features/newarrivals/data/cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/newarrivals/data/cubit/NewArrivals_states.dart';
import 'package:flutter_application_2/features/newarrivals/data/model/NewArrivals_model.dart';
import 'package:flutter_application_2/features/newarrivals/view/newarrivals_view.dart';
import 'package:flutter_application_2/features/newarrivals/widgets/newarrivalswidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class homeview extends StatefulWidget {
  const homeview({super.key});

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  int pageindex = 0;
  @override
  final List carouselimages = [
    'assets/immage1.jpg',
    'assets/immage2.jpg',
    'assets/immage3.jpg',
    'assets/immage4.jpg',
  ];
  @override
  NewArrivalsmodel newarrival = NewArrivalsmodel();
  late final CategoeirViewModel _model =
      CategoeirViewModel(CategoriesCubit.get(context));
  late final BestsellerViewModel _best =
      BestsellerViewModel(homeCubit.get(context));

  String? token;
  @override
  void initState() {
    ////////////////////////////////////////////////////////////
    homeCubit.get(context).getdata();
    NewArrivalsCubit.get(context).getNewArrivals();
    CategoriesCubit.get(context).GetAllCategoires();

    ////////////////////////////////////////////////////////////////////
    //var name = SharedPreferencHelper.getData(key: 'name');

    super.initState();
  }

  // var name = SharedPreferencHelper.getData(key: 'name');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderHome(),

            const Gap(15),
            ///////////////////////////////CarouselSlider/////////////////////////////////////////
            CarouselSlider.builder(
                itemCount: carouselimages.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                          // this is the temp is build and the count //
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            carouselimages[itemIndex],
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                options: CarouselOptions(
                  height: 160,
                  aspectRatio: 10 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      pageindex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                )),
            const Gap(20),
            Row(
              children: [
                Text(
                  AppStrings.BestSellerTitleHome,
                  style: getTitelstyle(color: AppColor.blackcolor),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      push(context, const bestsellerview());
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: AppColor.blackcolor,
                    ))
              ],
            ),
            /////////////////////////////Best Seller//////////////////////////////////////////////
            const Gap(13),
            BlocBuilder<homeCubit, homeStates>(
              builder: (context, state) {
                if (state is homeSuccessState) {
                  return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return BestSellerInfo(
                            bestseller: _best.products[index],
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: _best.products.length),
                  );
                }
                if (state is homeLoadingState) {
                  return Skeletonizer(
                    enabled: true,
                    child: SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return BestSellerInfo(
                              isloading: true,
                            );
                          },
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: 15),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            /**************************Categories*************************** */
            const Gap(10),
            Row(
              children: [
                const Gap(10),
                Text(
                  AppStrings.CategoriesTitleHome,
                  style: getTitelstyle(color: AppColor.blackcolor),
                ),
                const Spacer(),
              ],
            ),
            const Gap(10),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: BlocBuilder<CategoriesCubit, categoriesState>(
                builder: (context, state) {
                  if (state is categoriesSuccessState) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return Maincategories(
                          category: _model.categories[index],
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: _model.categories.length,
                    );
                  }
                  if (state is categoriesLoadingState) {
                    return Skeletonizer(
                      enableSwitchAnimation: true,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Maincategories(
                            category: Categories(
                                id: 2, name: 'jjdwnfjkds', productsCount: 5),
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(5),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Text(
                  AppStrings.NewArrivalsTitleHome,
                  style: getTitelstyle(color: AppColor.blackcolor),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      push(context, const NewArrivalsView());
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: AppColor.blackcolor,
                    ))
              ],
            ),
            /////////////////////////////
            BlocBuilder<NewArrivalsCubit, NewArrivalsState>(
              builder: (context, state) {
                if (state is newarrivalsSuccessState) {
                  return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalsDetils(
                            newarrivals: _best.products[index],
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: 6),
                  );
                }
                if (state is newarrivalsloadingState) {
                  return Skeletonizer(
                    enableSwitchAnimation: true,
                    child: SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return NewArrivalsDetils(
                              isloading: true,
                            );
                          },
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: 15),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
