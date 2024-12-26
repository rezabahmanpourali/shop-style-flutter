import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/custom_slider.dart';
import 'package:shop_style/home/widgets/header_slider.dart';
import 'package:shop_style/home/widgets/sliderWidgets/bottom_lable_score.dart';
import 'package:shop_style/home/widgets/sliderWidgets/lable_map.dart';
import 'package:shop_style/home/widgets/sliderWidgets/number_money.dart';
import 'package:shop_style/home/widgets/sliderWidgets/shop_name_icon.dart';
import 'package:shop_style/home/widgets/sliderWidgets/title_name.dart';

class MapInProducts extends StatelessWidget {
  const MapInProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    List<String> images = [
      'assets/images/3.jpeg',
      'assets/images/3.jpeg',
      'assets/images/3.jpeg',
      'assets/images/3.jpeg',
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: height / 3.2,
        child: Padding(
          padding: EdgeInsets.only(
            right: width / 40,
          ),
          child: Column(
            children: [
              const HeaderSlider(
                title: 'محصولات منطقه شما',
                textColor: Colors.black,
              ),
              Expanded(
                child: CustomSlider(
                  customWid: 2.8,
                  images: images,
                  lable: const LableMap(),
                  heightPic: 6.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TitleName(),
                      const ShopNameIcon(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          children: [
                            const NumberMoney(),
                            SizedBox(height: height / 400),
                            const Spacer(),
                            SizedBox(height: height / 400),
                            const BottomLableScore(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
