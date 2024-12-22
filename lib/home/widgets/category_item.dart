import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CategoryItem extends StatelessWidget {
  final double width;
  final bool isSelected; // وضعیت انتخاب‌شده بودن
  final VoidCallback onTap; // تابع برای انجام عملیات کلیک

  const CategoryItem({
    super.key,
    required this.width,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 43,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.bgBlack : AppColors.whiteCategory,
          borderRadius: const BorderRadius.all(
            Radius.circular(44),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 4),
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                color: isSelected
                    ? AppColors.greySelectCategory
                    : AppColors.greyCategory,
              ),
              child: const Icon(
                Icons.cut,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 9),
              child: Text(
                'رنگ مو',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.searchBoxEvents,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
