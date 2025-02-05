import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/features/bestseller/view/bestseller_detil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bestseller/data/BestSeller_cubit/Info_Cubit.dart';
import '../../bestseller/data/BestSeller_cubit/info_statets.dart';

class CategroeListView extends StatefulWidget {
  const CategroeListView({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.Sallery,
    required this.disscond,
    required this.salarydiss,
    required this.id,
  });

  final String image;
  final String name;
  final String type;
  final String Sallery;
  final String disscond;
  final String salarydiss;
  final int id;

  @override
  State<CategroeListView> createState() => _categoriesWidgetState();
}

class _categoriesWidgetState extends State<CategroeListView> {
  @override
  bool isSnackBarShown = false;
  void showSnackBarOnce(BuildContext context) {
    if (!isSnackBarShown) {
      setState(() {
        isSnackBarShown = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.AddCart),
          backgroundColor: Colors.green,
          duration: const Duration(microseconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                push(
                    context,
                    BestsellerDetil(
                      id: widget.id,
                    ));
              },
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    width: 100,
                    height: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image:
                            DecorationImage(image: NetworkImage(widget.image))),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.bluecolor,
                    ),
                    height: 20,
                    width: 30,
                    child: Text('${widget.disscond}%'),
                  )
                ],
              ),
            ),
            const Gap(25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  SizedBox(
                    height: 20,
                    width: 150,
                    child: Text(
                      widget.name,
                      style: getTitelstyle(
                          color: AppColor.blackcolor, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    widget.type,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getBodystyle(color: AppColor.greycolor),
                  ),
                  const Gap(15),
                  Text(
                    '${widget.Sallery}L.E',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: AppColor.greycolor),
                  ),
                  Text(
                    '${widget.salarydiss}L.E',
                    style: getBodystyle(color: AppColor.bluecolor),
                  ),
                ],
              ),
            ),
            const Gap(25),
            Column(
              children: [
                const Gap(10),
                IconButton(
                    onPressed: () {
                      Infcubit.get(context).addTofav(bookId: widget.id);
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
                      showSnackBarOnce(context);
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () =>
                            Infcubit.get(context).addToCart(bookId: widget.id),
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
