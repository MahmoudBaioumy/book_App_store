import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/fav/widget/wishlist_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<homeCubit>().getWishlist();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite Books',
          style: getTitelstyle(color: AppColor.bluecolor),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.favorite_outline_sharp,
          color: AppColor.bluecolor,
        ),
      ),
      body: BlocBuilder<homeCubit, homeStates>(
        buildWhen: (previous, current) =>
            current is GetWishlistSuccess || current is GetWishlistLoading,
        builder: (context, state) {
          if (state is GetWishlistSuccess) {
            var list = state.getWishListResponse.data?.data;
            return list == null || list.isEmpty
                ? const Center(
                    child: Text('No Favourite Books'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return WishlistItemWidget(
                          wishlistItem: list[index],
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        height: 30,
                      ),
                    ),
                  );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: AppColor.bluecolor,
            ));
          }
        },
      ),
    );
  }
}
