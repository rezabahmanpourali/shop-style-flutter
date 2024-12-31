import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/widgets/header_for_screen.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/widgets/price_invoice.dart';
import 'package:shop_style/common/widgets/scoring.dart';
import 'package:shop_style/common/widgets/reserve_servise.dart';
import 'package:shop_style/reserve_page4/screen/widgets/component_information.dart';

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
          child: Directionality(
            textDirection: TextDirection.rtl,
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
                        'جزئیات مبالغ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(height: height / 60),
                      const Row(
                        children: [
                          PriceInvoice(
                            advancePayment: 'پیش پرداخت رزرو نوبت',
                            discount: 'مبلغ تخفیف',
                            totalPrice: 'جمع کل',
                            payable: 'قابل پرداخت',
                          ),
                          PriceInvoice(
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
                        'نکته',
                        style: Theme.of(context).textTheme.labelMedium,
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
                          child: Text(
                            'اگر در مورد رزرو نوبت خود نکته ای وجود دارد در این بخش بنویسید. (آرایشگر این نکته را خواهد دید)',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.contanerBorder),
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
                    color: AppColors.dividerColor900,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      children: [
                        Container(
                          width: 179,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.bgBlack,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'پرداخت و رزرو نوبت',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: AppColors.white2),
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
                              ?.copyWith(color: AppColors.textSearchColor),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
          'انتخاب تاریخ و ساعت',
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
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Scoring(),
                Text(
                  'آدرس کامل آرایشگاه',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: height / 40),
        ComponentInformation(
          context: context,
          icon: const Icon(
            Icons.text_snippet_outlined,
          ),
          text: 'یکشنبه 1 دی ماه 1403',
        ),
        SizedBox(height: height / 100),
        ComponentInformation(
          context: context,
          icon: const Icon(
            Icons.text_snippet_outlined,
          ),
          text: 'ساعت 10:00 الی 10:30 صبح',
        ),
        SizedBox(height: height / 100),
        ComponentInformation(
          context: context,
          icon: const Icon(
            Icons.text_snippet_outlined,
            color: AppColors.yellow,
          ),
          text:
              'در صورتی که در بازه مشخص شده در آرایشگاه حضور پیدا نکنید نوبت شما منقضی خواهد شد',
          hasImportant: true,
        ),
        SizedBox(height: height / 100),
        const Divider(
          height: 1,
          color: AppColors.dividerColor900,
          endIndent: 22,
          indent: 22,
        ),
      ],
    );
  }
}
