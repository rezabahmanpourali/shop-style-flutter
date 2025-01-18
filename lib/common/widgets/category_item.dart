import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
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
                  padding: EdgeInsets.only(
                    right: (Provider.of<GlobalController>(context).language ==
                            'fa')
                        ? 8
                        : 0,
                    left: (Provider.of<GlobalController>(context).language ==
                            'fa')
                        ? 0
                        : 8,
                    bottom: 7,
                  ),
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
