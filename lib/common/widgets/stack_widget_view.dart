import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/model/services_model.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';
import 'package:shop_style/reserve_page4/screen/reserve_page4.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ServicesView extends StatefulWidget {
  final ServiceModel serviceModel;
  final bool isLastItem;
  final bool shouldNavigate;

  const ServicesView({
    super.key,
    required this.serviceModel,
    required this.isLastItem,
    this.shouldNavigate = true,
  });

  @override
  _ServicesViewState createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  bool isSelected = false; // وضعیت انتخاب یا تیک

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.serviceModel.hairModel.name,
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
                  if (widget.shouldNavigate) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                            value: locator.get<BarberController>(),
                            child: ReservePage2(),
                          );
                        },
                      ),
                    );
                  } else {
                    setState(() {
                      isSelected = !isSelected; // تغییر وضعیت
                    });
                  }
                },
                child: Container(
                  width: isSelected ? 35 : 100,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.cardWhite,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    color: isSelected
                        ? AppColors.tankBlueButton
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            color: Colors.white, // رنگ تیک
                            size: 30,
                          ),
                        if (!isSelected)
                          Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context)!.book_appointment,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 10,
                                ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            widget.serviceModel.price.toString(),
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: AppColors.textHeader),
          ),
          if (!widget.isLastItem) const SizedBox(height: 16),
          if (!widget.isLastItem)
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
