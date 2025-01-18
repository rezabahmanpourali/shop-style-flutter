import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/price_invoice.dart';
import 'package:shop_style/common/widgets/reserve_servise.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/main.dart';
import 'package:shop_style/reserve_page5/screen/widgets/select_option.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ResevePage5 extends StatefulWidget {
  const ResevePage5({super.key});

  @override
  State<ResevePage5> createState() => _ResevePage5State();
}

class _ResevePage5State extends State<ResevePage5> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Consumer<GlobalController>(
          builder: (context, globalController, child) {
            return Directionality(
              textDirection: globalController.language == 'fa' ||
                      globalController.language == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset('assets/images/1.jpeg'),
                        ),
                        Positioned(
                          top: 14,
                          left: globalController.language == 'fa'
                              ? width * 0.05
                              : width * 0.85,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MyApp(),
                              ));
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white2,
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.cardWhite,
                                ),
                              ),
                              child: const Icon(Icons.arrow_forward),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 22,
                          right: 22,
                          child: Text(
                            'نام آرایشگاه',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 32,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SelectOption(),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: ReserveServise(type: TypeReserveServise.modell),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 22),
                          Row(
                            children: [
                              PriceInvoice(
                                advancePayment: AppLocalizations.of(context)!
                                    .pre_payment_for_reservation,
                                discount: AppLocalizations.of(context)!
                                    .discount_amount,
                                totalPrice:
                                    AppLocalizations.of(context)!.total_amount,
                                payable: AppLocalizations.of(context)!.paid,
                                remaining:
                                    AppLocalizations.of(context)!.remaining,
                              ),
                              const PriceInvoice(
                                textAlign: TextAlign.end,
                                advancePayment: '40,000 تومان',
                                discount: '10,000 تومان',
                                totalPrice: '30,000 تومان',
                                payable: '30,000 تومان',
                                remaining: '0 تومان',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 40),
                      child: Text(
                        AppLocalizations.of(context)!.appointment_id,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.greyB9),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
