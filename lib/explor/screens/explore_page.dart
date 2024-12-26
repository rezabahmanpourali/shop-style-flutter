import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shop_style/common/configs/colors.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
        child: Stack(
          children: [
            // متن بالای صفحه
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
                        top: 6, // فاصله از بالا
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
                              color: AppColors.cardWhite,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.cardWhite,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.menu),
                                ),
                                const Spacer(),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'آرایشگاه های اطراف',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.categoryBlack,
                                      ),
                                    ),
                                    Text(
                                      'بر حسب موقعیت شما',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textSearchColor,
                                      ),
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
              maxChildSize: 0.8, // حداکثر ارتفاع قابل کشیدن
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
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.cardWhite,
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('مرتب سازی'),
                                          Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                        ],
                                      ),
                                    ),
                                    // قیمت
                                    Container(
                                      margin: const EdgeInsets.only(right: 12),
                                      width: 69,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.cardWhite,
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('قیمت'),
                                          Icon(Icons
                                              .keyboard_arrow_down_rounded),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                '3 آرایشگاه نزدیک',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Image.asset('assets/images/uuacu.jpg'),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 22, right: 22),
                                child: Row(
                                  children: [
                                    Text(
                                      'نام آرایشگاه',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'حدود',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '5',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.purpleOpacity,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'کیلومتر',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Padding(
                                padding: EdgeInsets.only(right: 22),
                                child: Row(
                                  children: [
                                    Icon(Icons.star),
                                    SizedBox(width: 5),
                                    Text('4.9'),
                                    SizedBox(width: 5),
                                    Text('(55)'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 7),
                              const Padding(
                                padding: EdgeInsets.only(right: 22),
                                child: Row(
                                  children: [
                                    Text(
                                      'قم، پردیسان، آدرس آرایشگاه',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textSearchColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Divider(
                                color: AppColors.dividerColor900,
                                endIndent: 22,
                                indent: 22,
                              ),
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.only(right: 22, left: 22),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'مدل موی خامه ای',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.categoryBlack,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.av_timer,
                                                size: 16,
                                                color:
                                                    AppColors.textSearchColor),
                                            SizedBox(width: 4),
                                            Text(
                                              '40 دقیقه',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    AppColors.textSearchColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '125,000 تومان',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textSearchColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.only(right: 22, left: 22),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'مدل موی خامه ای',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.categoryBlack,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.av_timer,
                                                size: 16,
                                                color:
                                                    AppColors.textSearchColor),
                                            SizedBox(width: 4),
                                            Text(
                                              '40 دقیقه',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    AppColors.textSearchColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '125,000 تومان',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textSearchColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.only(right: 22),
                                child: Row(
                                  children: [
                                    Text(
                                      'مشاهده بیشتر',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.purpleOpacity,
                                      ),
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
}
