import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/comment_model.dart';
import 'package:shop_style/common/configs/colors.dart';

class UserComment extends StatelessWidget {
  final CommentModel commentBarberShop;
  UserComment({
    required this.commentBarberShop,
    super.key,
  });

  String convertToPersianDate(String isoDate) {
    try {
      // تبدیل رشته ISO 8601 به تاریخ میلادی
      DateTime dateTime = DateTime.parse(isoDate);

      // تبدیل تاریخ میلادی به تاریخ شمسی
      Jalali jalaliDate = Jalali.fromDateTime(dateTime);

      // بازگرداندن تاریخ به فرمت دلخواه (مثال: 2025-01-10)
      return '${jalaliDate.year}-${jalaliDate.month.toString().padLeft(2, '0')}-${jalaliDate.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/Ellipse49.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نام نویسنده دیدگاه',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    convertToPersianDate(
                        commentBarberShop.createdAt.toString()),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.textHeader),
                  )
                ],
              )
            ],
          ),
          Row(
            children: List.generate(
              5,
              (index) {
                double rating = commentBarberShop.rating;

                if (index < rating) {
                  return const Icon(Icons.star);
                } else {
                  return const Icon(Icons.star_border);
                }
              },
            ),
          ),
          const SizedBox(height: 6),
          Text(
            commentBarberShop.comment,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.black),
          ),
          const SizedBox(height: 6),
          Text(
            'خواندن همه',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
