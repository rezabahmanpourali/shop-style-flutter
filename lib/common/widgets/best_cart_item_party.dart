import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/home/models/barber_hair_model.dart';
import 'package:shop_style/locator.dart';

class BestCardItemParty extends StatelessWidget {
  final HairModel hairModel;
  const BestCardItemParty({
    super.key, required this.hairModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator.get<GlobalController>().update(2);
      },
      child: Container(
        width: 132,
        height: 242,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.cardWhite),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                child: Image.network(
                  hairModel.images.isNotEmpty
                          ? hairModel.images[0].url ??
                              'assets/images/images1.jpg'
                          : 'assets/images/images1.jpg',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        hairModel.name!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 20),
                          Text(
                            '4.9',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '(55)',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'نام آرایشگاه',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textHeader),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 74,
                        height: 23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            width: 1,
                            color: AppColors.cardWhite,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'مدل مو',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
