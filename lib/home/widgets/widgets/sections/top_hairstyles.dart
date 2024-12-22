import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/widgets/custom_slider.dart';
import 'package:shop_style/home/widgets/widgets/header_slider.dart';
import 'package:shop_style/home/widgets/widgets/sliderWidgets/lable_score.dart';
import 'package:shop_style/home/widgets/widgets/sliderWidgets/number_money.dart';
import 'package:shop_style/home/widgets/widgets/sliderWidgets/shop_name_icon.dart';
import 'package:shop_style/home/widgets/widgets/sliderWidgets/title_name.dart';

class TopHairstyles extends StatelessWidget {
  const TopHairstyles({super.key});

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
        height: height / 3.1,
        child: Padding(
          padding: EdgeInsets.only(
            right: width / 40,
          ),
          child: Column(
            children: [
              const HeaderSlider(
                title: 'مدل موهای برتر',
                textColor: Colors.black,
              ),
              Expanded(
                child: CustomSlider(
                  customWid: 2.5,
                  images: images,
                  lable: const LableScore(),
                  heightPic: 6.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const TitleName(),
                      SizedBox(height: height / 400),
                      const ShopNameIcon(),
                      SizedBox(height: height / 400),
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
