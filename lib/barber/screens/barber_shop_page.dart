import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_style/View_comments/View_comments_screen.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/comment_model.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/barber_shop_list/screens/widgets/barber_shop_list.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/barber_artists.dart';
import 'package:shop_style/common/widgets/scoring.dart';
import 'package:shop_style/common/widgets/service_categories.dart';
import 'package:shop_style/common/widgets/stack_widget_view.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/common/widgets/user_comment.dart';
import 'package:shop_style/home/widgets/barber_shop_list_widgets.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/reserve_page1/screens/service_selection_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarberShopPage extends StatefulWidget {
  const BarberShopPage({
    super.key,
    required this.barberShopId,
    required this.barberShopModel,
  });
  final int barberShopId;
  final BarberShopModel barberShopModel;

  @override
  State<BarberShopPage> createState() => _BarberShopPageState();
}

class _BarberShopPageState extends State<BarberShopPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        locator.get<BarberController>().fetchBarber(widget.barberShopId);
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        locator.get<BarberShopController>().fetchCommets(widget.barberShopId);
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        locator.get<BarberShopController>().fetchServic(widget.barberShopId);
      },
    );
  }

  BarberShopController barberShopController =
      locator.get<BarberShopController>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 266,
                          child: widget.barberShopModel.images != null &&
                                  widget.barberShopModel.images!.isNotEmpty
                              ? Image.network(
                                  widget.barberShopModel.images![0].url
                                      .toString(),
                                  fit: BoxFit.cover,
                                )
                              : Shimmer.fromColors(
                                  baseColor:
                                      Colors.grey.shade300, // رنگ پایه شیمر
                                  highlightColor:
                                      Colors.grey.shade100, // رنگ شیمر
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    width: double.infinity,
                                    height: 266,
                                  ),
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
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.bookmark,
                                size: 18,
                              ),
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
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.shareNodes,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 16)),
                  SliverToBoxAdapter(
                    child: getTitleNamePage(context),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 16)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22, left: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'خدمات',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 15),
                          ServiceCategories(
                            onTabChange: (index) {},
                            tabs: const ['کوتاهی', 'مدل مو', 'اصلاح صورت'],
                            content: [
                              Selector<BarberShopController, BlocStatus>(
                                builder: (context, serviceState, child) {
                                  return StateManageWidget(
                                    status: serviceState,
                                    loadingWidget: () {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorWidgetBuilder: (message, statusCode) {
                                      return Center(
                                        child: Text(
                                          message.toString(),
                                        ),
                                      );
                                    },
                                    completedWidgetBuilder: (value) {
                                      return SizedBox(
                                        height: value.isNotEmpty
                                            ? null
                                            : 250.0, // اگر آیتم‌ها وجود داشته باشند، ارتفاع متناسب می‌شود
                                        child: ListView.builder(
                                          shrinkWrap:
                                              true, // این باعث می‌شود لیست اندازه خود را با توجه به تعداد آیتم‌ها تنظیم کند
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: value.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final service = value[index];
                                            return ServicesView(
                                              serviceModel: service,
                                              isLastItem:
                                                  index == value.length - 1,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                selector: (context, controller) =>
                                    controller.servicState,
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
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.02,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: moreButton(context),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 32)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Text(
                        'اعضای آرایشگاه',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 16)),

                  SliverToBoxAdapter(
                    child: Selector<BarberController, BlocStatus>(
                      selector: (context, controller) =>
                          controller.barberStatus,
                      builder: (context, barberStatus, child) {
                        return StateManageWidget(
                          status: barberStatus,
                          loadingWidget: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidgetBuilder: (message, statusCode) {
                            return Center(
                              child: Text(
                                message.toString(),
                              ),
                            );
                          },
                          completedWidgetBuilder: (value) {
                            return SizedBox(
                              height: 140,
                              child: ListView.builder(
                                padding: const EdgeInsets.only(right: 22),
                                scrollDirection: Axis.horizontal,
                                itemCount: value.length,
                                itemBuilder: (context, index) {
                                  final barber = value[index];
                                  return BarberArtists(barberModel: barber);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'دیدگاه ها',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          Row(
                            children: List.generate(
                              5,
                              (index) {
                                int rating = widget
                                    .barberShopModel.comments![0].rating
                                    .toInt();

                                if (index < rating) {
                                  return const Icon(Icons.star);
                                } else {
                                  return const Icon(Icons.star_border);
                                }
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '4.5',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '(55)',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Divider(
                            height: 1,
                            color: AppColors.dividerColor900,
                            indent: 22,
                            endIndent: 22,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Selector<BarberShopController, BlocStatus>(
                      builder: (context, commentStatus, child) {
                        return StateManageWidget(
                          status: commentStatus,
                          loadingWidget: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidgetBuilder: (message, statusCode) {
                            return Center(
                              child: Text(message.toString()),
                            );
                          },
                          completedWidgetBuilder: (value) {
                            if (widget.barberShopModel.comments == null ||
                                widget.barberShopModel.comments!.isEmpty) {
                              return const Center(
                                child: Text('کامنتی موجود نیست'),
                              );
                            }

                            return SizedBox(
                              height: widget.barberShopModel.comments!.length *
                                  170.0,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    widget.barberShopModel.comments!.length,
                                itemBuilder: (context, index) {
                                  final comment =
                                      widget.barberShopModel.comments![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22),
                                    child: UserComment(
                                      commentBarberShop: comment,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      selector: (context, controller) =>
                          controller.commentStatus,
                    ),
                  ),

                  const SliverPadding(padding: EdgeInsets.only(top: 22)),
                  SliverToBoxAdapter(
                    child: moreButton(context),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 32)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'توضیحات',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            textAlign: TextAlign.right,
                            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای ',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: AppColors.black,
                                  fontSize: 14,
                                ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'خواندن همه',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 32)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'ساعت کاری',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 156,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                bool isSpecialItem = index == 0;

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: TimeWork(
                                    isSpecial: isSpecialItem,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 32)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22, right: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'موقعیت روی نقشه',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          const SizedBox(height: 22),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                              height: 236,
                              width: double.infinity,
                              child: FlutterMap(
                                options: MapOptions(
                                  initialCenter: LatLng(
                                      widget
                                          .barberShopModel.location!.latitude!,
                                      widget.barberShopModel.location!
                                          .longitude!),
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
                                        point: LatLng(
                                            widget.barberShopModel.location!
                                                .latitude!,
                                            widget.barberShopModel.location!
                                                .longitude!),
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
                          const SizedBox(height: 16),
                          Text(
                            'آدرس آرایشگاه',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.black),
                          ),
                          Text(
                            'نمایش روی نقشه',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 40)),

                  ///////////////////////////////////////////////////////

                  SliverToBoxAdapter(
                    child: Selector<BarberShopController, BlocStatus>(
                      builder: (context, value, child) {
                        return BarberShopListWidget(
                          title: 'آرایشگاه های نزدیک به این آرایشگاه',
                          barberShopListState:
                              barberShopController.barberShopState,
                          barbreShopData: barberShopController.barberShops,
                        );
                      },
                      selector: (p0, p1) => p1.barberShopState,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Selector<BarberShopController, BlocStatus>(
                      builder: (context, value, child) {
                        return BarberShopListWidget(
                          title: 'آرایشگاه های نزدیک شما',
                          barberShopListState:
                              barberShopController.topBarberShopState,
                          barbreShopData: barberShopController.topBarberShops,
                        );
                      },
                      selector: (p0, p1) => p1.barberShopState,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
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
                      padding:
                          const EdgeInsets.only(right: 7, bottom: 7, top: 7),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ServiceSelectionScreen(),
                              ));
                            },
                            child: Container(
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
              // Positioned(
              //   bottom: 5,
              //   child: Container(
              //     width: double.infinity,
              //     color: AppColors.arayeshColor,
              //     child: Row(
              //       children: [
              //         GestureDetector(
              //           onTap: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) =>
              //                   const ServiceSelectionScreen(),
              //             ));
              //           },
              //           child: Container(
              //             width: 179,
              //             height: 60,
              //             decoration: BoxDecoration(
              //               color: AppColors.bgBlack,
              //               borderRadius: BorderRadius.circular(8),
              //             ),
              //             child: const Center(
              //               child: Padding(
              //                 padding: EdgeInsets.only(left: 20, right: 20),
              //                 child: Text(
              //                   'رزرو نوبت',
              //                   style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w700,
              //                     color: AppColors.white2,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         const Spacer(),
              //         const Text(
              //           '6 مدل مو',
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             color: AppColors.textSearchColor,
              //           ),
              //         ),
              //         const Spacer(),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget moreButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const ViewCommentsScreen(),
        // ));
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: AppColors.cardWhite,
          ),
          borderRadius: BorderRadius.circular(48),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'مشاهده همه',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getTitleNamePage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.barberShopModel.barberShopName!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 6),
          const Scoring(),
          const SizedBox(height: 6),
          Text(
            'فاصله حدود 5 کیلومتر . آدرس کامل آرایشگاه',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.textHeader,
                  fontSize: 14,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            'تا ساعت 21:00 باز است',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.textHeader,
                  fontSize: 14,
                ),
          ),
          const SizedBox(height: 6),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            indent: 22,
            endIndent: 22,
          ),
        ],
      ),
    );
  }
}

class TimeWork extends StatelessWidget {
  final bool isSpecial;
  const TimeWork({
    super.key,
    this.isSpecial = false, // مقدار پیش‌فرض false است
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(
          'شنبه',
          style: isSpecial
              ? Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )
              : Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
        ),
        const Spacer(),
        Text(
          '10 صبح الی 9 شب',
          style: isSpecial
              ? Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )
              : Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
        ),
      ],
    );
  }
}
