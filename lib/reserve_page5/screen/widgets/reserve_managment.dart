import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ReserveManagment extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final VoidCallback ontab;
  const ReserveManagment({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.ontab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.porpleLight,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
