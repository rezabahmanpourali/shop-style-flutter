import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/home/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final VoidCallback onChange;
  const CategoryItem({
    super.key,
    required this.onChange,
    required this.categoryModel,
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
                    categoryModel.title,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.reserveContaner),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 80,
                  child: Image.network(
                    categoryModel.images.isNotEmpty
                        ? categoryModel.images[0].url
                        : 'assets/images/images1.jpg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
