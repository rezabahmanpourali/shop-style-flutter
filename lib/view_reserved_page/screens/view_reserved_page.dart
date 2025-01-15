import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewReservedPage extends StatefulWidget {
  const ViewReservedPage({super.key});

  @override
  State<ViewReservedPage> createState() => _ViewReservedPageState();
}

class _ViewReservedPageState extends State<ViewReservedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, top: 20, bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'رزرو ها',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, bottom: 12),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'جاری',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: ReserveItem(
                    title: "آرایشگاه رزرو شده",
                    date: "شنبه، 1 آذر ماه، 1401، ساعت 12:00 صبح",
                    service: "مدل موی خامه ای",
                    duration: "40 دقیقه",
                    price: "125,000 تومان",
                    onTapCallback: (bool isExpanded) {
                      print("آیا رزرو گسترش یافته است؟ $isExpanded");
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, bottom: 12),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'رزرو های قبلی',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: ReserveItem(
                    title: "آرایشگاه رزرو شده",
                    date: "شنبه، 1 آذر ماه، 1401، ساعت 12:00 صبح",
                    service: "مدل موی خامه ای",
                    duration: "40 دقیقه",
                    price: "125,000 تومان",
                    onTapCallback: (bool isExpanded) {
                      print("آیا رزرو گسترش یافته است؟ $isExpanded");
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, bottom: 12),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'لغو شده',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: ReserveItem(
                    title: "آرایشگاه رزرو شده",
                    date: "شنبه، 1 آذر ماه، 1401، ساعت 12:00 صبح",
                    service: "مدل موی خامه ای",
                    duration: "40 دقیقه",
                    price: "125,000 تومان",
                    onTapCallback: (bool isExpanded) {
                      print("آیا رزرو گسترش یافته است؟ $isExpanded");
                    },
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

class ReserveItem extends StatefulWidget {
  // دریافت داده‌ها و کال بک از بیرون
  final String title;
  final String date;
  final String service;
  final String duration;
  final String price;
  final Function? onTapCallback; // کال بک برای وضعیت تغییر کرده

  const ReserveItem({
    super.key,
    required this.title,
    required this.date,
    required this.service,
    required this.duration,
    required this.price,
    this.onTapCallback, // قابل اختیاری
  });

  @override
  State<ReserveItem> createState() => _ReserveItemState();
}

class _ReserveItemState extends State<ReserveItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });

            // اگر کال بک داده شده، فراخوانی می‌کنیم
            if (widget.onTapCallback != null) {
              widget.onTapCallback!(_isExpanded);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 358,
            height: _isExpanded ? 393 : 109,
            decoration: BoxDecoration(
              color: AppColors.white2,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 12.3,
                  spreadRadius: 2,
                  color: AppColors.bgGrey,
                )
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  top: _isExpanded ? 0 : 7,
                  left: _isExpanded ? 0 : 263,
                  right: _isExpanded ? 0 : 7,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: _isExpanded ? double.infinity : 95,
                          height: _isExpanded ? 230 : 95,
                          decoration: BoxDecoration(
                            borderRadius: _isExpanded
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  )
                                : BorderRadius.circular(16),
                          ),
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
                    ],
                  ),
                ),
                Positioned(
                  top: _isExpanded ? 240 : 12,
                  left: _isExpanded ? 100 : 0,
                  right: _isExpanded ? 0 : 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 9),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.title, // دریافت عنوان از خارج
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: _isExpanded ? 20 : 16,
                                    ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.date, // تاریخ رزرو
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.service, // نام سرویس
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  Text(
                                    widget.duration, // مدت زمان
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  Text(
                                    widget.price, // قیمت
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Positioned(
                  bottom: 25,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                width: 1,
                                color: AppColors.contanerBorder,
                              ),
                            ),
                            width: _isExpanded ? 116 : 0,
                            height: _isExpanded ? 35 : 0,
                            child: Center(
                              child: Text(
                                'مسیریابی با نقشه',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 165,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                width: 1,
                                color: AppColors.contanerBorder,
                              ),
                            ),
                            width: _isExpanded ? 53 : 0,
                            height: _isExpanded ? 35 : 0,
                            child: Center(
                              child: _isExpanded
                                  ? const FaIcon(
                                      FontAwesomeIcons.calendarPlus,
                                      size: 18,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class ReserveItem extends StatefulWidget {
//   const ReserveItem({super.key,});

//   @override
//   State<ReserveItem> createState() => _ReserveItemState();
// }

// class _ReserveItemState extends State<ReserveItem> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isExpanded = !_isExpanded;
//             });
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             width: 358,
//             height: _isExpanded ? 393 : 109,
//             decoration: BoxDecoration(
//               color: AppColors.white2,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: const [
//                 BoxShadow(
//                   offset: Offset(0, 3),
//                   blurRadius: 12.3,
//                   spreadRadius: 2,
//                   color: AppColors.bgGrey,
//                 )
//               ],
//             ),
//             child: Stack(
//               children: [
//                 AnimatedPositioned(
//                   duration: const Duration(milliseconds: 400),
//                   curve: Curves.fastOutSlowIn,
//                   top: _isExpanded ? 0 : 7,
//                   left: _isExpanded ? 0 : 263,
//                   right: _isExpanded ? 0 : 7,
//                   child: Column(
//                     children: [
//                       Container(
//                         width: _isExpanded ? double.infinity : 95,
//                         height: _isExpanded ? 230 : 95,
//                         decoration: BoxDecoration(
//                           borderRadius: _isExpanded
//                               ? const BorderRadius.only(
//                                   topLeft: Radius.circular(16),
//                                   topRight: Radius.circular(16),
//                                 )
//                               : BorderRadius.circular(16),
//                         ),
//                         child: FlutterMap(
//                           options: const MapOptions(
//                             initialCenter: LatLng(34.571112, 50.808330),
//                             initialZoom: 13,
//                           ),
//                           children: [
//                             TileLayer(
//                               urlTemplate:
//                                   "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                               subdomains: const ['a', 'b', 'c'],
//                             ),
//                             MarkerLayer(
//                               markers: [
//                                 Marker(
//                                   point: const LatLng(34.571112, 50.808330),
//                                   child: Builder(
//                                     builder: (context) => const Icon(
//                                       Icons.location_pin,
//                                       size: 40,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   top: _isExpanded ? 240 : 12,
//                   left: _isExpanded ? 100 : 0,
//                   right: _isExpanded ? 0 : 80,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                            const SizedBox(width: 9),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'asdasd',
//                                 style: TextStyle(
//                                   fontSize: _isExpanded ? 20 : 16,
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColors.categoryBlack,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               const Text(
//                                 'شنبه، 1 آذر ماه، 1401، ساعت 12:00 صبح',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.categoryBlack,
//                                 ),
//                               ),
//                               const Row(
//                                 children: [
//                                   Text(
//                                     'مدل موی خامه ای',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                       color: AppColors.textSearchColor,
//                                     ),
//                                   ),
//                                   Text(
//                                     '40 دقیقه',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                       color: AppColors.textSearchColor,
//                                     ),
//                                   ),
//                                   Text(
//                                     '125,000 تومان',
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w400,
//                                       color: AppColors.textSearchColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 Positioned(
//                   bottom: 25,
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 12, left: 12),
//                     child: SizedBox(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           AnimatedContainer(
//                             duration: const Duration(milliseconds: 300),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(24),
//                               border: Border.all(
//                                 width: 1,
//                                 color: AppColors.contanerBorder,
//                               ),
//                             ),
//                             width: _isExpanded ? 116 : 0,
//                             height: _isExpanded ? 35 : 0,
//                             child: const Center(
//                               child: Text('مسیریابی با نقشه'),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 165,
//                           ),
//                           AnimatedContainer(
//                             duration: const Duration(milliseconds: 300),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(24),
//                               border: Border.all(
//                                 width: 1,
//                                 color: AppColors.contanerBorder,
//                               ),
//                             ),
//                             width: _isExpanded ? 53 : 0,
//                             height: _isExpanded ? 35 : 0,
//                             child: Center(
//                               child: _isExpanded ? const Icon(Icons.abc) : null,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
