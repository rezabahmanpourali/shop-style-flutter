import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.topPadding,
    this.textButton,
    this.onClick,
  });

  final double? topPadding;
  final String? textButton;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: ElevatedButton(
        onPressed: onClick ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          minimumSize: Size(width / 3, height / 18),
        ),
        child: Text(
          textButton ?? '',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.white2,
              ),
        ),
      ),
    );
  }
}
