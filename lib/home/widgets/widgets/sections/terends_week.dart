import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/widgets/header_slider.dart';
import 'package:shop_style/home/widgets/widgets/sliderWidgets/hairdresser_lable.dart';

class TerendWeek extends StatelessWidget {
  const TerendWeek({super.key});

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
        height: height / 5,
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
                child: ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return const Column(
                      children: [
                        HairdresserLable(size: 7),
                        Text(
                          'مدل مو',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'نام آرایشگاه',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
