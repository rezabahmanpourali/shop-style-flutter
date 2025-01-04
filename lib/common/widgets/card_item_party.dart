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
                      width: 50,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.white2,
                        // .withValues(alpha: 100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(27),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '22%',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.purpleOpacity,
                          ),
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
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text('نام مدل مو'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star),
                          Text('4.9'),
                          Text('(55)'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text('نام آرایشگاه'),
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
                            child: const Center(
                              child: Text(
                                '22%',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.cardWhiteTakhfif,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '189,000',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'تومان',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Text(
                            ' 139,000',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'تومان',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
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
