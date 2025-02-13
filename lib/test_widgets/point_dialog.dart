import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_style/common/configs/colors.dart';

class PointDialog extends StatefulWidget {
  const PointDialog({super.key});

  @override
  State<PointDialog> createState() => _PointDialogState();
}

class _PointDialogState extends State<PointDialog> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.white, // پس‌زمینه سفید برای دیالوگ
      content: Stack(
        clipBehavior: Clip.none, // مهم است که clipBehavior را none قرار دهید
        children: [
          // محتوای اصلی دیالوگ
          Container(
            width: double.maxFinite,
            height: 200,
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.04),
                    child: Text(
                      '!نظرتون برای ما مهمه',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'بر اساس تجربه خودتون به ما امتیاز بدید',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
            ),
          ),

          // دایره اول سفید
          Positioned(
            top: -60,
            right: width * 0.22,
            left: width * 0.22,
            child: Container(
              height: 99, // اندازه دایره بزرگ
              width: 99, // اندازه دایره بزرگ
              decoration: BoxDecoration(
                shape: BoxShape.circle, // دایره‌ای بودن
                color: Colors.white, // رنگ سفید
              ),
            ),
          ),

          // دایره دوم آبی کم‌رنگ
          Positioned(
            top: -55,
            right: width * 0.22,
            left: width * 0.22,
            child: Container(
              height: 85, // اندازه دایره دوم
              width: 85, // اندازه دایره دوم
              decoration: BoxDecoration(
                shape: BoxShape.circle, // دایره‌ای بودن
                color: AppColors.dialogBlueLight,
              ),
            ),
          ),

          // دایره سوم آبی پررنگ
          Positioned(
            top: -47,
            right: width * 0.22,
            left: width * 0.22,
            child: Container(
              height: 69,
              width: 69,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.dialogBlue,
              ),
              child: Center(
                child: Text('لوگو'),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            right: width * 0.15,
            child: Container(
              width: width * 0.4,
              height: height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: AppColors.dialogBlue2,
              ),
              child: Center(
                child: Text('ثبت'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const PointDialog(); // این دیالوگ سفید را نمایش می‌دهد
              },
            );
          },
          child: const Text('Show Dialog'), // دکمه برای باز کردن دیالوگ
        ),
      ),
    );
  }
}
