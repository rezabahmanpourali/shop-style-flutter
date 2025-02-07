import 'package:flutter/material.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ShowModelSort extends StatefulWidget {
  final Function(String) onSelectOption;
  final BarberShopController barberShopController; // پارامتر جدید
  const ShowModelSort({
    super.key,
    required this.onSelectOption,
    required this.barberShopController, // Callback برای ارسال داده به والد
  });

  @override
  _ShowModelSortState createState() => _ShowModelSortState();
}

class _ShowModelSortState extends State<ShowModelSort> {
  // متغیر برای ذخیره وضعیت انتخاب هر گزینه
  Map<int, bool> selectedOptions = {
    0: false, // وضعیت برای گزینه 1
    1: false, // وضعیت برای گزینه 2
    2: false, // وضعیت برای گزینه 3
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 303,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 22, right: 22, top: 32, bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
                Text(
                  'مرتب سازی',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ':مرتب سازی بر اساس',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: 22),
            // گزینه اول
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptions[0] = !selectedOptions[0]!;
                });
                widget.barberShopController.updateSortOption('ALL');

                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: selectedOptions[0]!
                              ? AppColors.tankBlueButton
                              : AppColors.cardWhite,
                          width: selectedOptions[0]! ? 4 : 1),
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'پیشنهادی',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // گزینه دوم
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptions[1] =
                      !selectedOptions[1]!; // تغییر وضعیت انتخاب گزینه دوم
                });
                widget.barberShopController.updateSortOption('TOP_BARBERS');
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: selectedOptions[1]!
                              ? AppColors.tankBlueButton
                              : AppColors.cardWhite,
                          width: selectedOptions[1]! ? 4 : 1),
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'برترین',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 23),
            // گزینه سوم
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOptions[2] =
                      !selectedOptions[2]!; // تغییر وضعیت انتخاب گزینه سوم
                });
                widget.onSelectOption('ALL');
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: selectedOptions[2]!
                              ? AppColors.tankBlueButton
                              : AppColors.cardWhite,
                          width: selectedOptions[2]! ? 4 : 1),
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'نزدیک ترین به شما',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: AppColors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
