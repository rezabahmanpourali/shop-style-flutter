import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';


class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: AppColors.cardWhite,
          ),
          borderRadius: BorderRadius.circular(48),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'مشاهده همه',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}
