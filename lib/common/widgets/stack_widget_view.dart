import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/model/services_model.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';
import 'package:shop_style/reserve_page4/screen/reserve_page4.dart';

class ServicesView extends StatelessWidget {
  final ServiceModel serviceModel;
  final bool isLastItem; // پارامتر جدید برای شناسایی آخرین آیتم
  const ServicesView({
    super.key,
    required this.serviceModel,
    required this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceModel.hairModel.name,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 16,
                ),
          ),
          Row(
            children: [
              const Icon(Icons.av_timer_outlined),
              Text(
                '40 دقیقه',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: AppColors.textHeader),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangeNotifierProvider.value(
                          value: locator.get<BarberController>(),
                          child: ResevePage2(),
                        );
                      },
                    ),
                  );
                },
                child: Container(
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
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            serviceModel.price.toString(),
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: AppColors.textHeader),
          ),
          if (!isLastItem) const SizedBox(height: 16),
          if (!isLastItem)
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
