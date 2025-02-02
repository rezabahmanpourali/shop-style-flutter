import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;
  final Color checkColor;
  final Color activeColor;
  final Color borderColor;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 24.0,
    this.checkColor = AppColors.white2,
    this.activeColor = AppColors.tankBlueButton,
    this.borderColor = AppColors.cardWhite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: value
            ? Icon(
                Icons.check,
                color: checkColor,
                size: size - 6,
              )
            : null,
      ),
    );
  }
}
