import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/reserve_page5/screen/reseve_page5.dart';
import 'package:shop_style/reserve_page5/screen/widgets/reserve_managment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class SelectOption extends StatelessWidget {
  const SelectOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 6), // کمی فاصله از اطراف

                decoration: BoxDecoration(
                  color: AppColors.purpleOpacity,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.table_chart_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      AppLocalizations.of(context)!
                          .your_appointment_is_reserved,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: AppColors.white2),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Text(
            'یکشنبه، 1 دی ماه، 1402، ساعت 10:30 صبح',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20,
                ),
          ),
          const SizedBox(height: 22),
          ReserveManagment(
            icon: const Center(
              child: FaIcon(
                FontAwesomeIcons.calendarPlus,
                color: AppColors.purpleOpacity,
              ),
            ),
            ontab: () {},
            title: AppLocalizations.of(context)!.add_to_google_calendar,
            subtitle: AppLocalizations.of(context)!.set_a_reminder_for_yourself,
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 74,
          ),
          ReserveManagment(
            icon: const Center(
              child: FaIcon(
                FontAwesomeIcons.locationArrow,
                color: AppColors.purpleOpacity,
              ),
            ),
            ontab: () {},
            title: AppLocalizations.of(context)!.navigate_with_mapp,
            subtitle: AppLocalizations.of(context)!.salon_address,
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 74,
          ),
          ReserveManagment(
            icon: const Center(
              child: FaIcon(
                FontAwesomeIcons.calendarDay,
                color: AppColors.purpleOpacity,
              ),
            ),
            ontab: () {},
            title: AppLocalizations.of(context)!.manage_appointment,
            subtitle: AppLocalizations.of(context)!.reservation_advance_payment,
          ),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 0,
          ),
        ],
      ),
    );
  }
}
