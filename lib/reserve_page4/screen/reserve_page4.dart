import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/price_invoice.dart';
import 'package:shop_style/common/widgets/scoring.dart';
import 'package:shop_style/common/widgets/reserve_servise.dart';
import 'package:shop_style/reserve_page4/screen/widgets/component_information.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_style/reserve_page5/screen/reseve_page5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ReservePage4 extends StatefulWidget {
  const ReservePage4({super.key});

  @override
  State<ReservePage4> createState() => _ReservePage4State();
}

class _ReservePage4State extends State<ReservePage4> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Consumer<GlobalController>(
            builder: (context, globallController, child) {
              return Directionality(
                textDirection: globallController.language == 'fa' ||
                        globallController.language == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: CustomScrollView(
                  slivers: [
                    const HeaderScreen(),
                    SliverToBoxAdapter(
                      child: getHeaderSection(context, height, width),
                    ),
                    const SliverToBoxAdapter(
                      child: Column(
                        children: [
                          ReserveServise(type: TypeReserveServise.modell),
                          ReserveServise(type: TypeReserveServise.hairdresser),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: height / 50),
                          Text(
                            AppLocalizations.of(context)!.amount_details,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(height: height / 60),
                          Row(
                            children: [
                              PriceInvoice(
                                advancePayment: AppLocalizations.of(context)!
                                    .reservation_advance_payment,
                                discount: AppLocalizations.of(context)!
                                    .discount_amount,
                                totalPrice:
                                    AppLocalizations.of(context)!.total_amount,
                                payable: AppLocalizations.of(context)!
                                    .payable_amount,
                              ),
                              const PriceInvoice(
                                textAlign: TextAlign.end,
                                advancePayment: '40,000 تومان',
                                discount: '10,000 تومان',
                                totalPrice: '30,000 تومان',
                                payable: '30,000 تومان',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.description,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(height: height / 60),
                          Container(
                            width: 360,
                            height: 159,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.contanerBorder,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: TextField(
                                maxLines:
                                    5, // تعداد خطوط مجاز (برای متنی که بیشتر از یک خط است)
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .reservation_note,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        color: AppColors.contanerBorder,
                                        fontSize: 14,
                                      ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height / 30),
                        ],
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(
                        height: 2,
                        thickness: 3,
                        color: AppColors.dividerColor900,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ResevePage5(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 179,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.tankBlueButton,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      AppLocalizations.of(context)!
                                          .pay_and_reserve_appointment,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(color: AppColors.white2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '30,000 تومان',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.textTankBlue,
                                  ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getHeaderSection(BuildContext context, double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.review_and_confirm,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: height / 40),
        Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  'assets/images/3.jpeg',
                ),
              ),
            ),
            SizedBox(width: width / 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نام آرایشگاه',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
                const Scoring(),
                Text(
                  'آدرس کامل آرایشگاه',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 12,
                        color: AppColors.textSearchColor,
                      ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: height / 40),
        ComponentInformation(
          context: context,
          icon: const FaIcon(
            FontAwesomeIcons.calendar,
            size: 16,
          ),
          text: 'یکشنبه 1 دی ماه 1403',
        ),
        SizedBox(height: height / 100),
        ComponentInformation(
          context: context,
          icon: const FaIcon(
            FontAwesomeIcons.clock,
            size: 16,
          ),
          text: 'ساعت 10:00 الی 10:30 صبح',
        ),
        SizedBox(height: height / 100),
        ComponentInformation(
          context: context,
          icon: FaIcon(
            FontAwesomeIcons.brakeWarning,
            size: 16,
            color: AppColors.yellow,
          ),
          text: AppLocalizations.of(context)!
              .if_you_dont_show_up_in_the_given_time_slot_your_appointment_will_expire,
          hasImportant: true,
        ),
        SizedBox(height: height / 100),
        const Divider(
          height: 1,
          color: AppColors.dividerColor900,
          endIndent: 22,
          indent: 0,
        ),
      ],
    );
  }
}
