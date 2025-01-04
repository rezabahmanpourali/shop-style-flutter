import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CardItemParty extends StatelessWidget {
  const CardItemParty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      height: 242,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.cardWhite),
      ),
      child: Flex(
        direction: Axis.vertical,
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
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/images1.jpg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.white2,
                        // .withValues(alpha: 100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(27),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '22%',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.purple, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
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
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        'نام مدل مو',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 20),
                          Text(
                            '4.9',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '(55)',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.purple),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        'نام آرایشگاه',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.textSearchColor),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Container(
                            width: 29,
                            height: 14,
                            decoration: const BoxDecoration(
                              color: AppColors.purpleOpacity,
                              borderRadius: BorderRadius.all(
                                Radius.circular(27),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '22%',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: AppColors.cardWhiteTakhfif,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '189,000',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: AppColors.textPercentageProdact,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'تومان',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: AppColors.textPercentageProdact),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Text(
                            ' 139,000',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.black),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'تومان',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
