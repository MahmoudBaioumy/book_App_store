import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/image_manger.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/home_view.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/cart/view/cart_view.dart';
import 'package:flutter_application_2/features/fav/view/wishlist_view.dart';
import 'package:flutter_application_2/features/newarrivals/data/cubit/NewArrivals_cubit.dart';

import 'package:flutter_application_2/features/profile/view/profile_view.dart';
import 'package:flutter_application_2/features/profile/view_model/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottom_nav extends StatefulWidget {
  const bottom_nav({super.key});

  @override
  State<bottom_nav> createState() => _bottom_navState();
}

int _index = 0;
List<Widget> Screens = [
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => homeCubit(),
      ),
      BlocProvider(
        create: (context) => NewArrivalsCubit(),
      ),
    ],
    child: homeview(),
  ),
  const WishlistView(),
  const CartView(),
  BlocProvider(
    create: (context) => ProfileCubit(),
    child: const ProfileView(),
  )
];

class _bottom_navState extends State<bottom_nav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          //111111111
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageManger.HomeNavBar,
              ),
              activeIcon: SvgPicture.asset(
                ImageManger.HomeNavBar,
                colorFilter:
                    ColorFilter.mode(AppColor.bluecolor, BlendMode.srcIn),
              ),
              label: ''),

          /////////2222222222222222
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageManger.FavoriteNavBar,
                height: 20,
              ),
              activeIcon: SvgPicture.asset(
                ImageManger.FavoriteNavBar,
                height: 20,
                colorFilter:
                    ColorFilter.mode(AppColor.bluecolor, BlendMode.srcIn),
              ),
              label: ''),
          //////////////////33333333333333333333
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageManger.ShopeNavBar,
                height: 20,
              ),
              activeIcon: SvgPicture.asset(
                ImageManger.ShopeNavBar,
                height: 20,
                colorFilter:
                    ColorFilter.mode(AppColor.bluecolor, BlendMode.srcIn),
              ),
              label: ''),
          ///////////44444444444444444444444
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageManger.ProfileNavBar,
              ),
              activeIcon: SvgPicture.asset(
                ImageManger.ProfileNavBar,
                colorFilter:
                    ColorFilter.mode(AppColor.bluecolor, BlendMode.srcIn),
              ),
              label: '')
        ],
      ),
    );
  }
}
