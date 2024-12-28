import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shop_style/barber/widgets/barber_artist.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';

class BarberShopPage extends StatefulWidget {
  const BarberShopPage({super.key});

  @override
  State<BarberShopPage> createState() => _BarberShopPageState();
}

class _BarberShopPageState extends State<BarberShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 266,
                      child: Image.asset(
                        'assets/images/1.jpeg',
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 22,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: AppColors.cardWhite,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      right: 22,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.cardWhite,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      right: 70,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.cardWhite,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.share,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Text(
                    'نام کامل آرایشگاه',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22, top: 11),
                  child: Row(
                    children: [
                      Text('45'),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star_border),
                      Text('(55)'),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22, top: 15, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'فاصله حدود 5 کیلومتر',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSearchColor,
                            ),
                          ),
                          Text(
                            'آدرس کامل آرایشگاه',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSearchColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'تا ساعت 21:00 باز است',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSearchColor,
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
                  indent: 22,
                  endIndent: 22,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22, bottom: 12),
                  child: Text('خدمات'),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 22, left: 22),
                  child: ServiceCategories(
                    onTabChange: (index) {},
                    tabs: const ['کوتاهی', 'مدل مو', 'اصلاح صورت'],
                    content: [
                      Padding(
                        padding: const EdgeInsets.only(top: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('مدل موی خامه ای'),
                            Row(
                              children: [
                                const Icon(Icons.av_timer_outlined),
                                const Text('40 دقیقه'),
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
                                  child: const Center(
                                    child: Text('رزرو نوبت'),
                                  ),
                                ),
                              ],
                            ),
                            const Text('125,000 تومان'),
                            const SizedBox(
                              height: 16,
                            ),
                            const Divider(
                              height: 1,
                              color: AppColors.dividerColor900,
                              endIndent: 22,
                              indent: 22,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text('مدل موی خامه ای'),
                            Row(
                              children: [
                                const Icon(Icons.av_timer_outlined),
                                const Text('40 دقیقه'),
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
                                  child: const Center(
                                    child: Text('رزرو نوبت'),
                                  ),
                                ),
                              ],
                            ),
                            const Text('125,000 تومان'),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(left: 22, right: 22),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: AppColors.cardWhite,
                    ),
                    borderRadius: BorderRadius.circular(48),
                  ),
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'مشاهده همه',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Text(
                    'اعضای آرایشگاه',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: BarberArtists(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('دیدگاه ها'),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star_border),
                        ],
                      ),
                      Row(
                        children: [
                          Text('4.5'),
                          SizedBox(width: 5),
                          Text('(55)'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              const SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                  color: AppColors.dividerColor900,
                  indent: 22,
                  endIndent: 22,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 550,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: UserComment(),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 22,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(left: 22, right: 22),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: AppColors.cardWhite,
                    ),
                    borderRadius: BorderRadius.circular(48),
                  ),
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'مشاهده همه',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Text(
                    'توضیحات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22, left: 22),
                  child: Text(
                    textAlign: TextAlign.right,
                    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.categoryBlack,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Text(
                    'خواندن همه',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.purpleOpacity,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ساعت کاری',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 156,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const TimeWork();
                  },
                ),
              )),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Row(
                    children: [
                      Text(
                        'موقعیت روی نقشه',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 22),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SizedBox(
                      height: 236,
                      width: double.infinity, // تعیین عرض به صورت خودکار
                      child: FlutterMap(
                        options: const MapOptions(
                          initialCenter: LatLng(34.571112, 50.808330),
                          initialZoom: 13,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: const ['a', 'b', 'c'],
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: const LatLng(34.571112, 50.808330),
                                child: Builder(
                                  builder: (context) => const Icon(
                                    Icons.location_pin,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'آدرس آرایشگاه',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.categoryBlack,
                        ),
                      ),
                      Text(
                        'نمایش روی نقشه',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.purpleOpacity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'آرایشگاه های نزدیک به این آرایشگاه',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 242,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 22),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: CardItem(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'آرایشگاه های نزدیک شما',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 242,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, right: 22),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: CardItem(),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              const SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.dividerColor100,
                  height: 1,
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
                              'رزرو نوبت',
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
                        '6 مدل مو',
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
      ),
    );
  }
}

class ServiceCategories extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> content;
  final Function(int index) onTabChange;
  const ServiceCategories({
    super.key,
    required this.tabs,
    required this.content,
    required this.onTabChange,
  });

  @override
  State<ServiceCategories> createState() => _ServiceCategoriesState();
}

class _ServiceCategoriesState extends State<ServiceCategories> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
              widget.tabs.length,
              (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 35,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.categoryBlack
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        widget.tabs[index],
                        style: TextStyle(
                          color: currentIndex == index
                              ? AppColors.white2
                              : AppColors.categoryBlack,
                          fontSize: currentIndex == index ? 16 : 16,
                          fontWeight: currentIndex == index
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: widget.content[currentIndex],
        ),
      ],
    );
  }
}

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, left: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/Ellipse49.png'),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('نام نویسنده دیدگاه'),
                  Row(
                    children: [
                      Text('چهارشنبه، 25 آذر، 1403'),
                      SizedBox(width: 10),
                      Text('ساعت 21:47'),
                    ],
                  )
                ],
              )
            ],
          ),
          const Row(
            children: [
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star),
              Icon(Icons.star_border),
            ],
          ),
          const Text(
            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.categoryBlack,
            ),
          ),
          const Text(
            'خواندن همه',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.purpleOpacity,
            ),
          ),
        ],
      ),
    );
  }
}

class TimeWork extends StatelessWidget {
  const TimeWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.green,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'شنبه',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          const Text(
            '10 صبح الی 9 شب',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
