import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class StackWidgetView extends StatelessWidget {
  const StackWidgetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مدل موی خامه ای',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Row(
            children: [
              const Icon(Icons.av_timer_outlined),
              Text(
                '40 دقیقه',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppColors.textHeader),
              ),
              const Spacer(),
              Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.cardWhite,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    'رزرو نوبت',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '125,000 تومان',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: AppColors.textHeader),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 22,
          ),
        ],
      ),
    );
  }
}
