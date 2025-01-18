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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOtpField(context),
          buildOtpField(context),
          buildOtpField(context),
          buildOtpField(context),
          buildOtpField(context),
        ],
      ),
    );
  }

  Widget buildOtpField(BuildContext context) {
    return Container(
      width: 47,
      height: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.otpColor,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12), // Padding for centering text
        ),
        onSaved: (pin) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Move to next field
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus(); // Move to previous field
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
