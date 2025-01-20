import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/BestSeller_cubit/home_states.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/Info_Cubit.dart';
import 'package:flutter_application_2/features/fav/model/datum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistItemWidget extends StatelessWidget {
  const WishlistItemWidget({
    super.key,
    required this.wishlistItem,
  });

  final WishlistItem wishlistItem;

  @override
  Widget build(BuildContext context) {
    int id;
    id = wishlistItem.id ?? 0;
    return BlocListener<homeCubit, homeStates>(
      listenWhen: (previous, current) => current is RemoveFromFavSuccess,
      listener: (context, state) {
        if (state is RemoveFromFavSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Removed from wishlist'),
              backgroundColor: AppColor.redcolor,
            ),
          );
          context.read<homeCubit>().getWishlist();
        }
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              wishlistItem.image ?? '',
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(15),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        wishlistItem.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: getTitelstyle(color: AppColor.bluecolor),
                      )),
                      //* ------------------ Remove from wishlist
                      IconButton(
                          onPressed: () {
                            context
                                .read<homeCubit>()
                                .removeFromWishList(wishlistItem.id ?? 0);
                          },
                          icon: Icon(
                            Icons.delete_forever_sharp,
                            size: 30,
                            color: AppColor.redcolor,
                          ))
                    ],
                  ),
                  Text(
                    wishlistItem.price ?? '',
                    style: getTitelstyle(color: AppColor.bluecolor),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      height: 50,
                      width: 150,
                      text: 'Add to cart',
                      textStyle: getBodystyle(color: AppColor.white1color),
                      onPressed: () {
                        Infcubit.get(context).addToCart(bookId: id);
                      }),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
