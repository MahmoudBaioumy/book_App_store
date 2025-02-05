import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/constants/appstrings.dart';
import 'package:flutter_application_2/core/function/routing.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:flutter_application_2/core/widget/Custom_But.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/Info_Cubit.dart';
import 'package:flutter_application_2/features/bestseller/data/BestSeller_cubit/info_statets.dart';
import 'package:flutter_application_2/features/bestseller/view/bestseller_detil.dart';
import 'package:flutter_application_2/features/buttom_nav/view/buttom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewArrival_list_Widget extends StatefulWidget {
  const NewArrival_list_Widget({
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
  State<NewArrival_list_Widget> createState() => _NewArrivals_widgetState();
}

class _NewArrivals_widgetState extends State<NewArrival_list_Widget> {
  @override
  bool snak = false;
  showSuccessDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: AppColor.white1color,
        builder: (_) => SimpleDialog(
              alignment: Alignment.center,
              backgroundColor: AppColor.white1color,
              contentPadding: const EdgeInsets.all(20),
              children: [
                const Gap(20),
                Image.asset(
                  'assets/done.png',
                  height: 150,
                  width: 150,
                ),
                const Gap(20),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.Success,
                          style: getTitelstyle(fontSize: 24)),
                      const Gap(20),
                      Text(
                        AppStrings.AddCartSuccess,
                        textAlign: TextAlign.center,
                        style: getBodystyle(color: AppColor.bluecolor),
                      ),
                      const Gap(30),
                      CustomButton(
                        bgColor: AppColor.bluecolor,
                        textStyle: getBodystyle(color: AppColor.white1color),
                        text: 'Back To Home ',
                        onPressed: () {
                          pushAndRemoveUntil(context, const bottom_nav());
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
  }

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
              BestsellerDetil(
                id: widget.id,
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
                      image:
                          DecorationImage(image: NetworkImage(widget.image))),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.bluecolor,
                  ),
                  height: 20,
                  width: 30,
                  child: Text('${widget.diss}%'),
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
                    widget.name,
                    style:
                        getTitelstyle(color: AppColor.blackcolor, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Gap(10),
                Text(
                  widget.type,
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
                  '${widget.salaryydiss}L.E',
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
                      showSuccessDialog();
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
