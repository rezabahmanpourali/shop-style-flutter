import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_style/common/configs/colors.dart';

class ShowModelPrice extends StatefulWidget {
  final Function(String) onSelectOption;
  final VoidCallback onApplyPressed; // Callback برای دکمه اعمال

  const ShowModelPrice({
    super.key,
    required this.onSelectOption,
    required this.onApplyPressed, // Callback برای ارسال داده به والد
  });

  @override
  _ShowModelPriceState createState() => _ShowModelPriceState();
}

class _ShowModelPriceState extends State<ShowModelPrice> {
  double _currentPrice = 100;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 312,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
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
                    'قیمت',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
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
              height: 38,
            ),
            const Divider(
              color: AppColors.dividerColor900,
            ),
            const SizedBox(
              height: 38,
            ),
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
