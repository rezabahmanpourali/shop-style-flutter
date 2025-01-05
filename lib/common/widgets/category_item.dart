import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CategoryItem extends StatelessWidget {
  final VoidCallback onChange;
  const CategoryItem({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChange,
      child: Column(
        children: [
          Container(
            width: 168,
            height: 75,
            decoration: BoxDecoration(
              color: AppColors.dividerColor100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 7, right: 8),
                  child: Text(
                    'اصلاح موی سر',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors.reserveContaner),
                  ),
                ),
                SizedBox(
                  child: Image.asset('assets/images/Subtract.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}