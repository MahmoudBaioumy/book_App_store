import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/BestSellerModel/bestseller_model.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/BestSeller_view.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/NewArrivalsmodel/NewArrivals_model.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/NewArrivalsmodel/NewArrivals_view.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/cubit/NewArrivals_cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals/view/home/view_model/cubit/NewArrivals_cubit/NewArrivals_states.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/Categori_Model.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/categories_States.dart';
import 'package:flutter_application_2/features/Home/view/categories/model/cubit/categories_cubit.dart';
import 'package:flutter_application_2/features/Home/view/categories/view/build_listcategore.dart';
import 'package:flutter_application_2/features/Home/widget/NewArrivalswidget/NewArrivalswidget.dart';
import 'package:flutter_application_2/features/Home/widget/bestsallerwidget/Bestsellerwidget.dart';
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
  BestSellerModel model = BestSellerModel();
  NewArrivalsmodel Model = NewArrivalsmodel();
  categoriesModel MModel = categoriesModel();
  String? name;

  @override
  void initState() {
    ////////////////////////////////////////////////////////////
    homeCubit.get(context).getdata();
    NewArrivalsCubit.get(context).getNewArrivals();
    categoriesCubit.get(context).getcategories();
    ////////////////////////////////////////////////////////////////////
    name = SharedPreferencHelper.getData(key: 'name');
    print('$name xczxczxcxzczxczx');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, $name',
                      style: getTitelstyle(color: AppColor.blackcolor),
                    ),
                    const Gap(6),
                    Text(
                      'What are You reading today?',
                      style: getBodystyle(color: AppColor.greycolor),
                    ),
                  ],
                ),
                const Gap(25),
                const Expanded(
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                )
              ],
            ),
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
                  'Best Seller',
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
            BlocConsumer<homeCubit, homeStates>(
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
                  return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Bestsellerwidget(
                            sallerydis: model
                                .data!.products![index].priceAfterDiscount!
                                .toString(),
                            discond: model.data!.products![index].discount!
                                .toString(),
                            image: model.data!.products![index].image!,
                            text: model.data!.products![index].name!,
                            sallery: model.data!.products![index].price!,
                          );
                        },
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: model.data!.products!.length),
                  );
                }
                if (state is homeLoadingState) {
                  return Skeletonizer(
                    enableSwitchAnimation: true,
                    child: SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Bestsellerwidget(
                              sallerydis: 300.toString(),
                              discond: 30.toString(),
                              image:
                                  'https://pngimg.com/uploads/book/book_PNG51041.png',
                              text: 'Data Science feom Scratc..',
                              sallery: 300.toString(),
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
            //////////////Categories/////////////////////////////////////////////////////
            const Gap(10),
            Row(
              children: [
                const Gap(10),
                Text(
                  'Categories',
                  style: getTitelstyle(color: AppColor.blackcolor),
                ),
                const Spacer(),
              ],
            ),
            const Gap(10),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: BlocConsumer<categoriesCubit, categoriesState>(
                listener: (context, state) {
                  if (state is categoriesSuccessState) {
                    setState(() {
                      MModel = state.Model!;
                    });
                  }
                  if (state is categoriesErrorState) {
                    print(state.Error);
                  }
                },
                builder: (context, state) {
                  if (state is categoriesSuccessState) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return categoriesbuild(
                          image: 'assets/immage3.jpg',
                          titel: MModel.data!.categories![index].name!,
                          id: MModel.data!.categories![index].id!,
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: MModel.data!.categories!.length,
                    );
                  }
                  if (state is categoriesLoadingState) {
                    return Skeletonizer(
                      enableSwitchAnimation: true,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return const categoriesbuild(
                            image: 'assets/immage3.jpg',
                            titel: 'Software',
                            id: 1,
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
                  'New Arrivals',
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
            BlocConsumer<NewArrivalsCubit, NewArrivalsState>(
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
                  return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return NewArrivalswidget(
                            disconds: Model.data!.products![index].discount!
                                .toString(),
                            salarydis: Model
                                .data!.products![index].priceAfterDiscount!
                                .toString(),
                            image: Model.data!.products![index].image!,
                            text: Model.data!.products![index].name!,
                            salary: Model.data!.products![index].price!,
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
                            return NewArrivalswidget(
                              salarydis: 300.toString(),
                              disconds: 30.toString(),
                              image:
                                  'https://pngimg.com/uploads/book/book_PNG51041.png',
                              text: 'Data Science feom Scratc..',
                              salary: 300.toString(),
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
