import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowModelFilter extends StatefulWidget {
  final VoidCallback onApplyPressed; // Callback برای دکمه اعمال

  final Function(String) onSelectOption;

  const ShowModelFilter(
      {super.key, required this.onSelectOption, required this.onApplyPressed});

  @override
  State<ShowModelFilter> createState() => _ShowModelFilterState();
}

class _ShowModelFilterState extends State<ShowModelFilter> {
  double _currentPrice = 100;
  bool _isSwitched = false;

  String formatPrice(double price) {
    final formatter = NumberFormat('#,###'); // فرمت هزارگان
    return formatter.format(price);
  }

  void _onSliderChanged(double newValue) {
    setState(() {
      _currentPrice = newValue;
    });
    widget.onSelectOption(
        _currentPrice.toStringAsFixed(0)); // ارسال مقدار به والد
  }

  void _resetSlider() {
    setState(() {
      _currentPrice = 0;
    });
    widget.onSelectOption(_currentPrice.toStringAsFixed(0));
  }

  // متغیر برای ذخیره وضعیت انتخاب هر گزینه
  Map<int, bool> selectedOptions = {
    0: false, // وضعیت برای گزینه 1
    1: false, // وضعیت برای گزینه 2
    2: false, // وضعیت برای گزینه 3
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.9,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                  Text(
                    'فیلترها',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ':مرتب سازی بر اساس',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            // گزینه اول
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptions[0] = !selectedOptions[0]!;
                  });
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
            ),
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptions[1] =
                        !selectedOptions[1]!; // تغییر وضعیت انتخاب گزینه دوم
                  });
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
            ),
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOptions[2] =
                        !selectedOptions[2]!; // تغییر وضعیت انتخاب گزینه سوم
                  });
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
            ),
            const SizedBox(
              height: 32,
            ),
            const Divider(
              indent: 22,
              endIndent: 22,
              color: AppColors.dividerColor900,
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                children: [
                  Text(
                    formatPrice(_currentPrice),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const Spacer(),
                  Text(
                    'حداکثر قیمت',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Slider(
              inactiveColor: AppColors.tankBlueButton,
              value: _currentPrice,
              min: 0,
              max: 1000000,
              divisions: 100, // تعداد تقسیمات خط کش
              label: _currentPrice.toStringAsFixed(2),
              onChanged: _onSliderChanged, // تابعی که در هنگام درگ اجرا می‌شود
              activeColor: AppColors.tankBlueButton,
            ),
            const SizedBox(
              height: 32,
            ),
            const Divider(
              indent: 22,
              endIndent: 22,
              color: AppColors.dividerColor900,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, right: 22, bottom: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ':فقط این مورد رو نشون بده',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdvancedSwitch(
                    activeColor: AppColors.tankBlueButton,
                    inactiveColor: Colors.grey,
                    initialValue: _isSwitched,
                    onChanged: (value) {
                      _isSwitched = value;
                    },
                    width: 42,
                    height: 20,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'تایید شده',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'این آرایشگاه های توسط {نام وبسایت} تایید شده اند',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    'assets/images/Group.svg',
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _currentPrice != 0 ? _resetSlider : null,
                    child: Container(
                      width: 174,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: AppColors.cardWhite,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'پاک کردن همه',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      widget.onApplyPressed();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 174,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.tankBlueButton,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'اعمال',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.white2,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
