import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/reserve_page5/screen/reseve_page5.dart';
import 'package:shop_style/reserve_page5/screen/widgets/reserve_managment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 170,
                height: 35,
                decoration: BoxDecoration(
                  color: AppColors.purpleOpacity,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.table_chart_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'نوبت شما رزرو شد',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.white2),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            'یکشنبه، 1 دی ماه، 1402، ساعت 10:30 صبح',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 22),
          ReserveManagment(
            icon: const Center(
              child: FaIcon(
                FontAwesomeIcons.calendarPlus,
                color: AppColors.purpleOpacity,
              ),
            ),
            ontab: () {},
            title: 'افزودن به تقویم گوگل',
            subtitle: 'برای خود یک یادآور بگذارید',
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 74,
          ),
          ReserveManagment(
            icon: const Center(
              child: FaIcon(
                FontAwesomeIcons.locationArrow,
                color: AppColors.purpleOpacity,
              ),
            ),
            ontab: () {},
            title: 'مسیریابی با نقشه',
            subtitle: 'آدرس آرایشگاه',
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 74,
          ),
          ReserveManagment(
            icon: const Center(
              child: FaIcon(
                FontAwesomeIcons.calendarDay,
                color: AppColors.purpleOpacity,
              ),
            ),
            ontab: () {},
            title: 'مدیریت نوبت',
            subtitle:
                'تا 24 ساعت میتوانید نوبت خود را تغییر داده یا آن را لغو کنید',
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 0,
          ),
        ],
      ),
    );
  }
}
