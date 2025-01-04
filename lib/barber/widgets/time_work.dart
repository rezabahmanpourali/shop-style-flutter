import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';


class TimeWork extends StatelessWidget {
  const TimeWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.green,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'شنبه',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black),
        ),
        const Spacer(),
        Text(
          '10 صبح الی 9 شب',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
