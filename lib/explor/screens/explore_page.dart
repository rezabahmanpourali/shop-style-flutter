import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();

  bool _isMenuIcon = true;

  void _toggleIcon() {
    setState(() {
      _isMenuIcon = !_isMenuIcon;
    });

    if (_isMenuIcon) {
      // حرکت به پایین
      _scrollController.animateTo(
        0.1, // حداقل اندازه
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // حرکت به بالا
      _scrollController.animateTo(
        0.9, // حداکثر اندازه
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.9);
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      FlutterMap(
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
                      Positioned(
                        top: 6,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.only(left: 22, right: 22),
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.white2,
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              width: 2,
                              color: AppColors.white2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _toggleIcon();
                                    print('object');
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: AppColors.cardWhite,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: _isMenuIcon
                                        ? const Icon(Icons.menu)
                                        : const Icon(Icons.close),
                                  ),
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('آرایشگاه های اطراف',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    Text(
                                      'بر حسب موقعیت شما',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              color: AppColors.textSearchColor),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.search),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // باتم شیت در پایین صفحه

            DraggableScrollableSheet(
              initialChildSize: 0.6, // اندازه اولیه باتم شیت (60% از صفحه)
              minChildSize: 0.1, // حداقل ارتفاع قابل کشیدن
              maxChildSize: 0.85, // حداکثر ارتفاع قابل کشیدن
              controller: _scrollController,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 57,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColors.cardWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  children: [
                                    // فیلتر
                                    Container(
                                      margin: const EdgeInsets.only(right: 24),
                                      width: 50,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.cardWhite,
                                        ),
                                      ),
                                      child:
                                          const Icon(Icons.filter_list_rounded),
                                    ),
                                    // مرتب سازی
                                    Container(
                                      margin: const EdgeInsets.only(right: 12),
                                      width: 110,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.cardWhite,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'مرتب سازی',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          const Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                        ],
                                      ),
                                    ),
                                    // قیمت
                                    Container(
                                      margin: const EdgeInsets.only(right: 12),
                                      width: 75,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.cardWhite,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'قیمت',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          const Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '3 آرایشگاه نزدیک',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.textHeader),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 220,
                                    child: PageView.builder(
                                      controller: controller,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                            left: 22,
                                            right: 22,
                                            bottom: 20,
                                          ),
                                          height: 220,
                                          child: Image.asset(
                                              'assets/images/uuacu.jpg'),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 30,
                                    right: 180,
                                    child: SmoothPageIndicator(
                                      controller: controller,
                                      count: 3,
                                      effect: const SlideEffect(
                                        spacing: 8.0,
                                        radius: 50.0,
                                        dotWidth: 10.0,
                                        dotHeight: 10.0,
                                        paintStyle: PaintingStyle.stroke,
                                        strokeWidth: 1.5,
                                        dotColor: Colors.grey,
                                        activeDotColor: AppColors.bannerColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, right: 22),
                                child: Row(
                                  children: [
                                    Text(
                                      'نام آرایشگاه',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    const Spacer(),
                                    Text(
                                      'حدود',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '5',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              color: AppColors.purpleOpacity),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'کیلومتر',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 22),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star),
                                    const SizedBox(width: 5),
                                    Text(
                                      '4.9',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '(55)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 7),
                              Padding(
                                padding: const EdgeInsets.only(right: 22),
                                child: Row(
                                  children: [
                                    Text(
                                      'قم، پردیسان، آدرس آرایشگاه',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              color: AppColors.textSearchColor),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              modellMoForShop(),
                              const SizedBox(height: 16),
                              modellMoForShop(),
                              const SizedBox(height: 32),
                              Padding(
                                padding: const EdgeInsets.only(right: 22),
                                child: Row(
                                  children: [
                                    Text(
                                      'مشاهده بیشتر',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(color: AppColors.purple),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget shopInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/uuacu.jpg'),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'نام آرایشگاه',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Spacer(),
              Text(
                'حدود',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(width: 5),
              Text(
                '5',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.purple),
              ),
              const SizedBox(width: 5),
              Text(
                'کیلومتر',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(width: 5),
          Row(
            children: [
              const Icon(Icons.star),
              const SizedBox(width: 5),
              Text(
                '4.9',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(width: 5),
              Text(
                '(55)',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(width: 7),
          Text(
            'قم، پردیسان، آدرس آرایشگاه',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.textSearchColor),
          ),
          const SizedBox(height: 16),
          const Divider(
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 22,
          ),
        ],
      ),
    );
  }

  Widget modellMoForShop() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مدل موی خامه ای',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.av_timer,
                      size: 16, color: AppColors.textSearchColor),
                  const SizedBox(width: 4),
                  Text(
                    '40 دقیقه',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: AppColors.textSearchColor),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '125,000 تومان',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
