import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/custom_slider.dart';
import 'package:shop_style/home/widgets/header_slider.dart';
import 'package:shop_style/home/widgets/sliderWidgets/discount_percentage.dart';
import 'package:shop_style/home/widgets/sliderWidgets/name_shop.dart';
import 'package:shop_style/home/widgets/sliderWidgets/number_money.dart';
import 'package:shop_style/home/widgets/sliderWidgets/title_name.dart';

class KaleParty extends StatelessWidget {
  const KaleParty({super.key});

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
      child: Container(
        color: Colors.black,
        height: height / 3,
        child: Padding(
          padding: EdgeInsets.only(
            right: width / 40,
            top: height / 400,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(Icons.percent, color: Colors.white, size: 40),
                  SizedBox(
                    width: width / 1.15,
                    child: const HeaderSlider(
                      title: 'کله پارتی!',
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomSlider(
                  customWid: 2.8,
                  images: images,
                  lable: null,
                  heightPic: 6.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TitleName(),
                      SizedBox(height: height / 2000),
                      const NameShop(),
                      SizedBox(height: height / 2000),
                      const DiscountPercentage(),
                      SizedBox(height: height / 2000),
                      const NumberMoney(),
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
