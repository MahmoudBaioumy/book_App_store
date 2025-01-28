import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/Info_Cubit.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/cubit_info/info_statets.dart';
import 'package:flutter_application_2/features/Home/view/BestSellerview/info_bestseller/view/info_BestSeller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewArrivals_widget extends StatelessWidget {
  const NewArrivals_widget({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.Sallery,
    required this.diss,
    required this.salaryydiss,
    required this.id,
  });

  final String image;
  final String name;
  final String type;
  final String Sallery;
  final String diss;
  final String salaryydiss;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey),
      ),
      child: GestureDetector(
        onTap: () {
          push(
              context,
              moreinfo(
                id: id,
              ));
        },
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(image: NetworkImage(image))),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.bluecolor,
                  ),
                  height: 20,
                  width: 30,
                  child: Text('$diss%'),
                )
              ],
            ),
            const Gap(25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Text(
                    name,
                    style:
                        getTitelstyle(color: AppColor.blackcolor, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Gap(10),
                Text(
                  type,
                  style: getBodystyle(color: AppColor.greycolor),
                ),
                const Gap(15),
                Text(
                  '${Sallery}L.E',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: AppColor.greycolor),
                ),
                Text(
                  '${salaryydiss}L.E',
                  style: getBodystyle(color: AppColor.bluecolor),
                ),
              ],
            ),
            const Gap(25),
            Column(
              children: [
                const Gap(10),
                IconButton(
                    onPressed: () {
                      Infcubit.get(context).addTofav(bookId: id);
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: AppColor.blackcolor,
                    )),
                const Spacer(),
                BlocConsumer<Infcubit, infoStates>(
                  listener: (context, state) {
                    if (state is AddToCartSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Add To Cart Success'),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () =>
                            Infcubit.get(context).addToCart(bookId: id),
                        icon: Icon(Icons.add_shopping_cart,
                            size: 25, color: AppColor.blackcolor));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
