import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/Text_Styles.dart';
import 'package:flutter_application_2/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class shop_view extends StatefulWidget {
  const shop_view({super.key});

  @override
  State<shop_view> createState() => _shop_viewState();
}

class _shop_viewState extends State<shop_view> {
  @override
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 140,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                              image: AssetImage('assets/immage1.jpg'))),
                    ),
                    const Gap(10),
                    Column(
                      children: [
                        const Gap(20),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Text(
                                'Algorithms Uplugged',
                                maxLines: 1,
                                style: getBodystyle(color: AppColor.greycolor),
                              ),
                            ),
                            const Gap(15),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ))
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            ///////Row counter//////////////
                            Container(
                              height: 35,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) quantity--;
                                      });
                                    },
                                  ),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Gap(50),
                            Column(
                              children: [
                                const Text(
                                  '279.00 L.E',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                                Text('195.30 L.E',
                                    style: getBodystyle(
                                        color: AppColor.bluecolor,
                                        fontSize: 14)),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.bluecolor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Text(
                    'total price : 195.30 L.E',
                    style: getBodystyle(color: AppColor.white1color),
                  ),
                  const Spacer(),
                  Container(
                    height: 40,
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.white1color,
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'CheckOut',
                      style:
                          getBodystyle(color: AppColor.bluecolor, fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
