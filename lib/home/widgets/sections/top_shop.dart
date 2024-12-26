import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/sliderWidgets/award_first_buy.dart';
import 'package:shop_style/home/widgets/custom_slider.dart';
import 'package:shop_style/home/widgets/sliderWidgets/discount_first_buy.dart';
import 'package:shop_style/home/widgets/header_slider.dart';
import 'package:shop_style/home/widgets/sliderWidgets/bottom_lable_score.dart';
import 'package:shop_style/home/widgets/sliderWidgets/hairdresser_lable.dart';
import 'package:shop_style/home/widgets/sliderWidgets/lable_map.dart';
import 'package:shop_style/home/widgets/sliderWidgets/time_work.dart';
import 'package:shop_style/home/widgets/sliderWidgets/title_name.dart';

class TopShop extends StatelessWidget {
  const TopShop({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<String> images = [
      'assets/images/1.jpeg',
      'assets/images/1.jpeg',
      'assets/images/1.jpeg',
      'assets/images/1.jpeg',
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: height / 4,
        child: Padding(
          padding: EdgeInsets.only(
            right: width / 40,
          ),
          child: Column(
            children: [
              const HeaderSlider(
                title: 'آرایشگاه های برتر منطقه شما',
                textColor: Colors.black,
              ),
              Expanded(
                child: Stack(
                  children: [
                    CustomSlider(
                      customWid: 1.5,
                      images: images,
                      lable: Positioned(
                        top: height / 120,
                        left: width / 100,
                        child: const LableMap(),
                      ),
                      heightPic: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: height / 150),
                            Row(
                              children: [
                                const TitleName(),
                                SizedBox(height: height / 400),
                                const Spacer(),
                                SizedBox(height: height / 400),
                                const BottomLableScore(),
                              ],
                            ),
                            const TimeWork(),
                            Row(
                              children: [
                                const DiscountFirstBuy(),
                                SizedBox(width: width / 80),
                                const AwardFirstBuy(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height / 23,
                      child: const HairdresserLable(size: 9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
