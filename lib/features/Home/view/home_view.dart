import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Services/sp_helper/sp_helper.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/BestSeller_view.dart';
import 'package:flutter_application_2/features/Home/view/NewArrivals_view.dart';
import 'package:flutter_application_2/features/Home/view_model/BestSellerModel/bestseller_model.dart';
import 'package:flutter_application_2/features/Home/view_model/NewArrivalsmodel/NewArrivals_model.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/NewArrivals_cubit/NewArrivals_cubit.dart';
import 'package:flutter_application_2/features/Home/view_model/cubit/NewArrivals_cubit/NewArrivals_states.dart';
import 'package:flutter_application_2/features/Home/widget/NewArrivalswidget/NewArrivalswidget.dart';
import 'package:flutter_application_2/features/Home/widget/bestsallerwidget/Bestsellerwidget.dart';
import 'package:flutter_application_2/features/Home/widget/build_listcategore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
  String? name;

  @override
  void initState() {
    ////////////////////////////////////////////////////////////
    homeCubit.get(context).getdata();
    NewArrivalsCubit.get(context).getNewArrivals();
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
                  return CircularProgressIndicator(
                    color: AppColor.bluecolor,
                  );
                }
                return const SizedBox();
              },
            ),
            //////////////Categories/////////////////////////////////////////////////////
            Row(
              children: [
                Text(
                  'Categories',
                  style: getTitelstyle(color: AppColor.blackcolor),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: AppColor.blackcolor,
                    ))
              ],
            ),
            const Gap(5),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const categoriesbuild(
                    image: 'assets/immage4.jpg',
                    titel: 'mahmoud',
                  );
                },
                separatorBuilder: (context, index) => const Gap(5),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
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
                  return CircularProgressIndicator(
                    color: AppColor.bluecolor,
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
