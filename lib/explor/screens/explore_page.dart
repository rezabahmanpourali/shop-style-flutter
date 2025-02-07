import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/explor/screens/explore_page_search.dart';
import 'package:shop_style/explor/widgets/barber_shop_carousel.dart';
import 'package:shop_style/explor/widgets/show_model_filter.dart';
import 'package:shop_style/explor/widgets/show_model_price.dart';
import 'package:shop_style/explor/widgets/show_model_sort.dart';
import 'package:shop_style/locator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();

  int? selectedMarkerIndex;
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();

    // بارگذاری داده‌ها بعد از ایجاد ویجت
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BarberShopController>(context, listen: false)
          .fetchBarberShops();
    });
  }

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

  BarberShopController barberShopController =
      locator.get<BarberShopController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = PageController(viewportFraction: 1);
    bool isTopShop = selectedMarkerIndex != null &&
        selectedMarkerIndex! >= barberShopController.barberShops.length;
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
                          initialZoom: 5,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: const ['a', 'b', 'c'],
                          ),
                          MarkerLayer(
                            markers: [
                              ...barberShopController.barberShops,
                              ...barberShopController.topBarberShops,
                            ]
                                .asMap()
                                .map((index, barberShops) {
                                  final isSelected =
                                      selectedMarkerIndex == index;
                                  // برای شناسایی اینکه این آرایشگاه از کدام لیست آمده است
                                  bool isTopShop = index >=
                                      barberShopController.barberShops.length;
                                  return MapEntry(
                                    index,
                                    Marker(
                                      point: LatLng(
                                        barberShops.location?.latitude ??
                                            34.571112,
                                        barberShops.location?.longitude ??
                                            50.808330,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (selectedMarkerIndex == index) {
                                              selectedMarkerIndex = null;
                                            } else {
                                              selectedMarkerIndex = index;
                                            }
                                          });
                                        },
                                        child: isSelected
                                            ? const Icon(
                                                Icons.location_on,
                                                size: 30,
                                                color: Colors.black,
                                              )
                                            : Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  );
                                })
                                .values
                                .toList(),
                          ),
                        ],
                      ),
                      if (selectedMarkerIndex != null)
                        Positioned(
                          bottom: 100,
                          child: GestureDetector(
                            onTap: () {
                              // بررسی اینکه آیا اندیس معتبر است
                              bool isTopShop = selectedMarkerIndex! >=
                                  barberShopController.barberShops.length;

                              // انتخاب آرایشگاه صحیح با بررسی معتبر بودن اندیس
                              BarberShopModel selectedBarberShop;
                              if (isTopShop) {
                                int topIndex = selectedMarkerIndex! -
                                    barberShopController.barberShops.length;
                                if (topIndex >= 0 &&
                                    topIndex <
                                        barberShopController
                                            .topBarberShops.length) {
                                  selectedBarberShop = barberShopController
                                      .topBarberShops[topIndex];
                                } else {
                                  // در صورتی که اندیس در محدوده نیست، خطا یا آرایشگاه پیش‌فرض را نشان دهید

                                  return;
                                }
                              } else {
                                if (selectedMarkerIndex! >= 0 &&
                                    selectedMarkerIndex! <
                                        barberShopController
                                            .barberShops.length) {
                                  selectedBarberShop = barberShopController
                                      .barberShops[selectedMarkerIndex!];
                                } else {
                                  // در صورتی که اندیس در محدوده نیست، خطا یا آرایشگاه پیش‌فرض را نشان دهید

                                  return;
                                }
                              }

                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return MultiProvider(
                                      providers: [
                                        ChangeNotifierProvider.value(
                                            value: locator
                                                .get<BarberController>()),
                                        ChangeNotifierProvider.value(
                                            value: locator
                                                .get<BarberShopController>()),
                                      ],
                                      child: BarberShopPage(
                                        barberShopModel: selectedBarberShop,
                                        barberShopId:
                                            selectedBarberShop.id ?? 0,
                                      ),
                                    );
                                  },
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);

                                    return SlideTransition(
                                        position: offsetAnimation,
                                        child: child);
                                  },
                                ),
                              );
                            },
                            child: AnimatedOpacity(
                              opacity: opacity,
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: width * 0.9,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.white2,
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: SizedBox(
                                        width: width * 0.3,
                                        height: height,
                                        child: Image.network(
                                          isTopShop
                                              ? barberShopController
                                                  .topBarberShops[
                                                      selectedMarkerIndex! -
                                                          barberShopController
                                                              .barberShops
                                                              .length]
                                                  .images![0]
                                                  .url
                                                  .toString()
                                              : barberShopController
                                                  .barberShops[
                                                      selectedMarkerIndex!]
                                                  .images![0]
                                                  .url
                                                  .toString(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          isTopShop
                                              ? barberShopController
                                                      .topBarberShops[
                                                          selectedMarkerIndex! -
                                                              barberShopController
                                                                  .barberShops
                                                                  .length]
                                                      .barberShopName ??
                                                  'نامی وجود ندارد'
                                              : barberShopController
                                                      .barberShops[
                                                          selectedMarkerIndex!]
                                                      .barberShopName ??
                                                  'نامی وجود ندارد',
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.star),
                                            Text('4.9'),
                                            Text('(55)'),
                                          ],
                                        ),
                                        const Text(
                                            'قم، پردیسان، آدرس آرایشگاه'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                            padding: EdgeInsets.only(
                              right: (Provider.of<GlobalController>(context)
                                          .language ==
                                      'fa')
                                  ? 5
                                  : 0,
                              left: (Provider.of<GlobalController>(context)
                                          .language ==
                                      'fa')
                                  ? 0
                                  : 5,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ExplorePageSearch(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _toggleIcon();
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .salons_near_you,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!
                                            .based_on_your_location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                color:
                                                    AppColors.textSearchColor,
                                                fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: (Provider.of<GlobalController>(
                                                      context)
                                                  .language ==
                                              'fa')
                                          ? 22
                                          : 0,
                                      right: (Provider.of<GlobalController>(
                                                      context)
                                                  .language ==
                                              'fa')
                                          ? 0
                                          : 22,
                                    ),
                                    child: const Icon(Icons.search),
                                  ),
                                ],
                              ),
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
              initialChildSize: 0.6,
              minChildSize: 0.1,
              maxChildSize: 0.85,
              controller: _scrollController,
              builder: (context, scrollController) {
                _scrollController.addListener(
                  () {
                    setState(() {
                      if (_scrollController.size == 0.1) {
                        opacity = 1.0;
                      } else if (_scrollController.size > 0.1) {
                        opacity = 0.0;
                      } else {
                        opacity = 1.0;
                      }
                    });
                  },
                );
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
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled:
                                              true, // برای کنترل ارتفاع باتم شیت
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return ShowModelFilter(
                                              onApplyPressed: () {},
                                              onSelectOption: (p0) {},
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          right: (Provider.of<GlobalController>(
                                                          context)
                                                      .language ==
                                                  'fa')
                                              ? 24
                                              : 0,
                                          left: (Provider.of<GlobalController>(
                                                          context)
                                                      .language ==
                                                  'fa')
                                              ? 0
                                              : 24,
                                        ),
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
                                        child: const Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.slidersUp,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // مرتب سازی
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return ShowModelSort(
                                              onSelectOption: (p0) {},
                                              barberShopController:
                                                  barberShopController,
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          right: (Provider.of<GlobalController>(
                                                          context)
                                                      .language ==
                                                  'fa')
                                              ? 12
                                              : 0,
                                          left: (Provider.of<GlobalController>(
                                                          context)
                                                      .language ==
                                                  'fa')
                                              ? 0
                                              : 12,
                                        ),
                                        width: 110,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
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
                                                AppLocalizations.of(context)!
                                                    .sort_by,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                      fontSize: 14,
                                                    )),
                                            const Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // قیمت
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return ShowModelPrice(
                                              onSelectOption: (p0) {},
                                              onApplyPressed: () {},
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          right: (Provider.of<GlobalController>(
                                                          context)
                                                      .language ==
                                                  'fa')
                                              ? 12
                                              : 0,
                                          left: (Provider.of<GlobalController>(
                                                          context)
                                                      .language ==
                                                  'fa')
                                              ? 0
                                              : 12,
                                        ),
                                        width: 75,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24),
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
                                              AppLocalizations.of(context)!
                                                  .price,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    fontSize: 14,
                                                  ),
                                            ),
                                            const Icon(Icons
                                                .keyboard_arrow_down_rounded),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // if (selectedMarkerIndex == null)
                              //   Column(
                              //     children: [
                              //       // اگر وضعیت مرتب‌سازی ALL باشد، همه‌ی آرایشگاه‌ها نمایش داده می‌شوند
                              //       if (barberShopController
                              //               .currentSortOption ==
                              //           'ALL')
                              //         ...barberShopController.barberShops
                              //             .map((barberShop) {
                              //           return BarberShopCarousel(
                              //             barberShopModel: barberShop,
                              //             controller: controller,
                              //             selectedMarkerIndex:
                              //                 selectedMarkerIndex,
                              //             barberShopController:
                              //                 barberShopController,
                              //           );
                              //         }).toList(),

                              //       if (barberShopController
                              //               .currentSortOption ==
                              //           'ALL')
                              //         ...barberShopController.topBarberShops
                              //             .map((barberShop) {
                              //           return BarberShopCarousel(
                              //             barberShopModel: barberShop,
                              //             controller: controller,
                              //             selectedMarkerIndex:
                              //                 selectedMarkerIndex,
                              //             barberShopController:
                              //                 barberShopController,
                              //           );
                              //         }).toList(),

                              //       // اگر وضعیت مرتب‌سازی TOP_BARBERS باشد، فقط آرایشگاه‌های topBarberShops نمایش داده می‌شوند
                              //       if (barberShopController
                              //               .currentSortOption ==
                              //           'TOP_BARBERS')
                              //         ...barberShopController.topBarberShops
                              //             .map((barberShop) {
                              //           return BarberShopCarousel(
                              //             barberShopModel: barberShop,
                              //             controller: controller,
                              //             selectedMarkerIndex:
                              //                 selectedMarkerIndex,
                              //             barberShopController:
                              //                 barberShopController,
                              //           );
                              //         }).toList(),
                              //     ],
                              //   ),
                              // if (selectedMarkerIndex != null)
                              //   // بررسی اینکه آیا selectedMarkerIndex مربوط به barberShops است یا topBarberShops
                              //   selectedMarkerIndex! <
                              //           barberShopController.barberShops.length
                              //       ? BarberShopCarousel(
                              //           barberShopModel: barberShopController
                              //                   .barberShops[
                              //               selectedMarkerIndex!], // آرایشگاه انتخاب‌شده از barberShops
                              //           controller: controller,
                              //           selectedMarkerIndex:
                              //               selectedMarkerIndex,
                              //           barberShopController:
                              //               barberShopController,
                              //         )
                              //       : BarberShopCarousel(
                              //           barberShopModel: barberShopController
                              //                   .topBarberShops[
                              //               selectedMarkerIndex! -
                              //                   barberShopController.barberShops
                              //                       .length], // آرایشگاه انتخاب‌شده از topBarberShops
                              //           controller: controller,
                              //           selectedMarkerIndex:
                              //               selectedMarkerIndex,
                              //           barberShopController:
                              //               barberShopController,
                              //         ),

                              Selector<BarberShopController, String>(
                                selector: (context, barberShopController) =>
                                    barberShopController.currentSortOption,
                                builder: (context, currentSortOption, child) {
                                  return Column(
                                    children: [
                                      // اگر وضعیت مرتب‌سازی ALL باشد، همه‌ی آرایشگاه‌ها نمایش داده می‌شوند
                                      if (selectedMarkerIndex == null)
                                        Column(
                                          children: [
                                            if (currentSortOption == 'ALL')
                                              ...barberShopController
                                                  .barberShops
                                                  .map((barberShop) {
                                                return BarberShopCarousel(
                                                  barberShopModel: barberShop,
                                                  controller: controller,
                                                  selectedMarkerIndex:
                                                      selectedMarkerIndex,
                                                  barberShopController:
                                                      barberShopController,
                                                );
                                              }).toList(),
                                            if (currentSortOption == 'ALL')
                                              ...barberShopController
                                                  .topBarberShops
                                                  .map((barberShop) {
                                                return BarberShopCarousel(
                                                  barberShopModel: barberShop,
                                                  controller: controller,
                                                  selectedMarkerIndex:
                                                      selectedMarkerIndex,
                                                  barberShopController:
                                                      barberShopController,
                                                );
                                              }).toList(),
                                            if (currentSortOption ==
                                                'TOP_BARBERS')
                                              ...barberShopController
                                                  .topBarberShops
                                                  .map((barberShop) {
                                                return BarberShopCarousel(
                                                  barberShopModel: barberShop,
                                                  controller: controller,
                                                  selectedMarkerIndex:
                                                      selectedMarkerIndex,
                                                  barberShopController:
                                                      barberShopController,
                                                );
                                              }).toList(),
                                          ],
                                        ),

                                      // اگر selectedMarkerIndex != null باشد، به صورت تک تک نمایش داده می‌شود
                                      if (selectedMarkerIndex != null)
                                        selectedMarkerIndex! <
                                                barberShopController
                                                    .barberShops.length
                                            ? BarberShopCarousel(
                                                barberShopModel:
                                                    barberShopController
                                                            .barberShops[
                                                        selectedMarkerIndex!], // آرایشگاه انتخاب‌شده از barberShops
                                                controller: controller,
                                                selectedMarkerIndex:
                                                    selectedMarkerIndex,
                                                barberShopController:
                                                    barberShopController,
                                              )
                                            : BarberShopCarousel(
                                                barberShopModel:
                                                    barberShopController
                                                            .topBarberShops[
                                                        selectedMarkerIndex! -
                                                            barberShopController
                                                                .barberShops
                                                                .length], // آرایشگاه انتخاب‌شده از topBarberShops
                                                controller: controller,
                                                selectedMarkerIndex:
                                                    selectedMarkerIndex,
                                                barberShopController:
                                                    barberShopController,
                                              ),
                                      
                                    ],
                                  );
                                },
                              )
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
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.av_timer,
                      size: 16, color: AppColors.textSearchColor),
                  const SizedBox(width: 4),
                  Text(
                    '40 دقیقه',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textSearchColor,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '125,000 تومان',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
