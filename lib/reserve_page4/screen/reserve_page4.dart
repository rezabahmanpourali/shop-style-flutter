import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class ReservePage4 extends StatefulWidget {
  const ReservePage4({super.key});

  @override
  State<ReservePage4> createState() => _ReservePage4State();
}

class _ReservePage4State extends State<ReservePage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.only(left: 22, right: 22, bottom: 0),
              sliver: SliverAppBar(
                backgroundColor: AppColors.arayeshColor,
                actions: [
                  Icon(Icons.close),
                  Spacer(),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 22, bottom: 22),
                child: Row(
                  children: [
                    Text(
                      'انتخاب تاریخ و ساعت',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 22, bottom: 31),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      width: 66,
                      height: 66,
                      child: Image.asset(
                        'assets/images/3.jpeg',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'نام آرایشگاه',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.categoryBlack,
                            ),
                          ),
                          Row(
                            children: [
                              Text('4.5'),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star_border),
                              Text('(55)'),
                            ],
                          ),
                          Text(
                            'آدرس کامل آرایشگاه',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textHeader,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 23, bottom: 15),
                child: Row(
                  children: [
                    Icon(Icons.text_snippet_outlined),
                    SizedBox(width: 7),
                    Text(
                      'یکشنبه 1 دی ماه 1403',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textHeader,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 23, bottom: 14),
                child: Row(
                  children: [
                    Icon(Icons.text_snippet_outlined),
                    SizedBox(width: 7),
                    Text(
                      'ساعت 10:00 الی 10:30 صبح',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textHeader,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 23, bottom: 15.5),
                child: Row(
                  children: [
                    Icon(
                      Icons.text_snippet_outlined,
                      color: AppColors.yellow,
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        softWrap:
                            true, // این ویژگی برای شکستن خودکار متن به خطوط متعدد است
                        maxLines:
                            3, // تعیین حداکثر تعداد خطوط (اگر بخواهید محدود کنید)
                        overflow: TextOverflow
                            .ellipsis, // اگر متن زیاد شد، با "..." نشان داده می‌شود
                        textAlign: TextAlign.start,
                        'در صورتی که در بازه مشخص شده در آرایشگاه حضور پیدا نکنید نوبت شما منقضی خواهد شد',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                height: 1,
                color: AppColors.dividerColor900,
                endIndent: 22,
                indent: 22,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16.5, left: 22, right: 24, bottom: 15.5),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('مدل موی خامه ای'),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Icon(Icons.settings_input_component),
                            SizedBox(
                              width: 4,
                            ),
                            Text('40 دقیقه'),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('125,000 تومان'),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/images/images (2) 1.png'),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                height: 1,
                color: AppColors.dividerColor900,
                endIndent: 22,
                indent: 22,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 24, left: 22, top: 24.5, bottom: 23.5),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('نام آرایشگر'),
                        SizedBox(
                          height: 12,
                        ),
                        Text('متخصص مدل مو و کوتاهی'),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/images/images (2) 1.png'),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                height: 1,
                color: AppColors.dividerColor900,
                endIndent: 22,
                indent: 22,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.5, right: 22, bottom: 12),
                child: Text(
                  'جزئیات مبالغ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22),
                child: Row(
                  children: [
                    Text(
                      'پیش پرداخت رزرو نوبت',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSearchColor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '40,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSearchColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 22, right: 22, top: 16, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      'مبلغ تخفیف',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.red,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '10,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      'جمع کل',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.categoryBlack,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '30,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.categoryBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 22, right: 22, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      'قابل پرداخت',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green3,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '30,000 تومان',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(right: 22, bottom: 22),
                child: Text(
                  'نکته',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
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
                      child: const Padding(
                        padding: EdgeInsets.only(left: 14, right: 16, top: 10),
                        child: Text(
                          'اگر در مورد رزرو نوبت خود نکته ای وجود دارد در این بخش بنویسید. (آرایشگر این نکته را خواهد دید)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.contanerBorder,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                padding: const EdgeInsets.only(right: 7, bottom: 7, top: 7),
                child: Row(
                  children: [
                    Container(
                      width: 179,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.bgBlack,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'پرداخت و رزرو نوبت',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '30,000 تومان',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSearchColor,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
