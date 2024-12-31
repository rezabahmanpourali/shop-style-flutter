import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class BestCardItemParty extends StatelessWidget {
  const BestCardItemParty({
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
              child: Image.asset(
                'assets/images/3.jpeg',
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
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 12, top: 12),
                      child: Text('نام مدل مو'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star),
                          Text('4.4'),
                          Text('(55)'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text('نام آرایشگاه'),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 74,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          width: 1,
                          color: AppColors.cardWhite,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'مدل مو',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.categoryBlack,
                          ),
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
    );
  }
}
