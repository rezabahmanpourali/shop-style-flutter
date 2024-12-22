import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  final PageController controller;
  final int itemCount;

  const BannerWidget({
    super.key,
    required this.controller,
    required this.itemCount,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  double _page = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _page = widget.controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 186, // تنظیم ارتفاع برای بنرها
            child: PageView.builder(
              controller: widget.controller,
              itemCount: widget.itemCount,
              itemBuilder: (context, index) {
                // محاسبه مقیاس عمودی (ارتفاع) برای بنر
                double scale = 1.0;
                double distance = (_page - index).abs(); // فاصله از صفحه فعال

                if (distance < 1.0) {
                  scale = 1 + (1 - distance) * 0.3; // بنر وسطی بزرگتر می‌شود
                } else {
                  scale = 1.0; // بنرهای کناری با اندازه اصلی خود
                }

                // تنظیم ارتفاع برای بنر وسطی
                double heightScale =
                    distance < 1.0 ? 1 + (1 - distance) * 0.3 : 1.0;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0), // حذف فاصله از چپ و راست
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Transform.scale(
                      scale: scale, // تغییر مقیاس از نظر عرض
                      child: Transform(
                        transform: Matrix4.identity()
                          ..scale(
                              1.0, heightScale), // تغییر مقیاس از نظر ارتفاع
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Builder(builder: (context) {
                            return Container(
                              width:
                                  width, // بنرها از چپ و راست به صفحه چسبیده‌اند
                              height: 186, // ارتفاع ثابت برای بنر
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // گوشه‌های بنرها گرد می‌شود
                              ),
                              child: Image.asset(
                                'assets/images/poster1.png',
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: widget.controller,
              count: widget.itemCount,
              effect: const SlideEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: AppColors.bannerColor,
                paintStyle: PaintingStyle.stroke,
              ),
            ),
          ),
        ],
      ),
    );
  }
}























// import 'package:flutter/material.dart';
// import 'package:shop_style/common/configs/colors.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class BannerWidget extends StatelessWidget {
//   final PageController controller;
//   final int itemCount;

//   const BannerWidget({
//     super.key,
//     required this.controller,
//     required this.itemCount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return SliverToBoxAdapter(
//       child: Column(
//         children: [
//           SizedBox(
//             height: height * 0.2,
//             child: PageView.builder(
//               controller: controller,
//               itemCount: itemCount,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(left: 12, right: 12),
//                   child: Container(
//                     height: height * 0.2,
//                     child: Image.asset('assets/images/poster1.png'),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: height * 0.01,
//           ),
//           Center(
//             child: SmoothPageIndicator(
//               controller: controller,
//               count: 3,
//               effect: const SlideEffect(
//                 dotHeight: 10,
//                 dotWidth: 10,
//                 activeDotColor: AppColors.bannerColor,
//                 paintStyle: PaintingStyle.stroke,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

