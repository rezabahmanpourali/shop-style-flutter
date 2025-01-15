import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_style/common/configs/colors.dart';

class NewOtpScreen extends StatelessWidget {
  const NewOtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        border: Border.all(
          width: 2,
          color: AppColors.cardWhite,
        ),
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 47,
            height: 47,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '0',
                border: InputBorder.none,
              ),
              onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty) {
                  FocusScope.of(context)
                      .previousFocus(); // به فیلد قبلی منتقل شود
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            width: 47,
            height: 47,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText:
                    '0', // این را برای دسترسی به فضای داخل دایره گذاشته‌ایم
                border: InputBorder.none, // حذف حاشیه پیش‌فرض
                contentPadding: EdgeInsets.all(
                    12), // فاصله از لبه‌ها برای قرار گرفتن در وسط
              ),
              onSaved: (pin2) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus(); // به فیلد بعدی منتقل شود
                } else if (value.isEmpty) {
                  FocusScope.of(context)
                      .previousFocus(); // به فیلد قبلی منتقل شود
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            width: 47,
            height: 47,
            child: TextFormField(
              onSaved: (pin3) {},
              decoration: const InputDecoration(
                hintText: '0',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            width: 47,
            height: 47,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '0',
                border: InputBorder.none,
              ),
              onSaved: (pin4) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty) {
                  FocusScope.of(context)
                      .previousFocus(); // به فیلد قبلی منتقل شود
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
