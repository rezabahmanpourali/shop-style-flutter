import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_style/View_comments/View_comments_screen.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/barber_shop_saved_model.dart';
import 'package:shop_style/barber/model/comment_model.dart';
import 'package:shop_style/barber/model/services_model.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/barber_shop_list/screens/widgets/barber_shop_list.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

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
  Box<BarberShopSavedModel> box = Hive.box<BarberShopSavedModel>('CardBox');
  late Box<BarberShopSavedModel> recentVisitsBox;
  @override
  void initState() {
    super.initState();
    recentVisitsBox = Hive.box<BarberShopSavedModel>('recentVisitsBox');
    _saveRecentlyViewedShop();
    //////////////////////////
    var savedBarberShop = box.get(widget.barberShopId);
    widget.barberShopModel.isBookmarked =
        savedBarberShop?.isBookmarked ?? false;
    if (savedBarberShop != null) {
      widget.barberShopModel.isBookmarked = savedBarberShop.isBookmarked;
    }
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
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        locator.get<BarberShopController>().fetchBarberShops();
      },
    );
    Hive.openBox<BarberShopSavedModel>('CardBox');
  }

  void _saveRecentlyViewedShop() {
    var savedShop = recentVisitsBox.get(widget.barberShopId);

    if (savedShop == null) {
      recentVisitsBox.put(
        widget.barberShopId,
        BarberShopSavedModel(
          widget.barberShopId,
          barberShopName: widget.barberShopModel.barberShopName,
          imageUrl: widget.barberShopModel.images?.first.url,
          shopType: widget.barberShopModel.shopType,
          isBookmarked: widget.barberShopModel.isBookmarked,
        ),
      );
    }
  }

  BarberShopController barberShopController =
      locator.get<BarberShopController>();
  bool isBookmarked = false;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.arayeshColor,
      body: SafeArea(
        child: Consumer<GlobalController>(
          builder: (context, globallController, child) {
            return Directionality(
              textDirection: globallController.language == 'fa' ||
                      globallController.language == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Selector<BarberShopController, BlocStatus>(
                          selector: (context, controller) =>
                              controller.barberShopState,
                          builder: (context, barberShopState, child) {
                            return StateManageWidget(
                              status: barberShopState,
                              loadingWidget: () {
                                return Stack(
                                  children: [
                                    // شیمر برای تصویر
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        width: double.infinity,
                                        height: height * 0.3,
                                      ),
                                    ),
                                    if (!isLoading)
                                      Positioned(
                                        top: height * 0.02,
                                        right:
                                            globallController.language == 'fa'
                                                ? width * 0.85
                                                : width * 0.05,
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
                                            child:
                                                const Icon(Icons.arrow_forward),
                                          ),
                                        ),
                                      ),
                                    if (!isLoading)
                                      Positioned(
                                        top: height * 0.02,
                                        right:
                                            globallController.language == 'fa'
                                                ? width * 0.18
                                                : width * 0.85,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.barberShopModel
                                                      .isBookmarked =
                                                  !widget.barberShopModel
                                                      .isBookmarked;

                                              if (widget.barberShopModel
                                                  .isBookmarked) {
                                                box.put(
                                                  // widget.barberShopModel.id,
                                                  widget.barberShopId,
                                                  BarberShopSavedModel(
                                                    widget.barberShopModel.id,
                                                    barberShopName: widget
                                                        .barberShopModel
                                                        .barberShopName,
                                                    imageUrl: widget
                                                        .barberShopModel
                                                        .images![0]
                                                        .url,
                                                    shopType: widget
                                                        .barberShopModel
                                                        .shopType,
                                                    isBookmarked: widget
                                                        .barberShopModel
                                                        .isBookmarked,
                                                  ),
                                                );
                                              } else {
                                                box.delete(
                                                    widget.barberShopModel.id);
                                              }
                                            });
                                          },
                                          child: Container(
                                            width: 36,
                                            height: 36,
                                            decoration: const BoxDecoration(
                                              color: AppColors.cardWhite,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                widget.barberShopModel
                                                        .isBookmarked
                                                    ? Icons.bookmark
                                                    : Icons.bookmark_border,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (!isLoading)
                                      Positioned(
                                        top: height * 0.02,
                                        right:
                                            globallController.language == 'fa'
                                                ? width * 0.05
                                                : width * 0.72,
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
                                );
                              },
                              errorWidgetBuilder: (message, statusCode) {
                                return Center(child: Text(message ?? 'خطا'));
                              },
                              completedWidgetBuilder: (value) {
                                return Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 266,
                                      child: widget.barberShopModel.images !=
                                                  null &&
                                              widget.barberShopModel.images!
                                                  .isNotEmpty
                                          ? Image.network(
                                              widget.barberShopModel.images![0]
                                                  .url
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            )
                                          : Container(),
                                    ),
                                    Positioned(
                                      top: height * 0.02,
                                      right: globallController.language == 'fa'
                                          ? width * 0.85
                                          : width * 0.05,
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
                                          child:
                                              const Icon(Icons.arrow_forward),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: height * 0.02,
                                      right: globallController.language == 'fa'
                                          ? width * 0.18
                                          : width * 0.85,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            widget.barberShopModel
                                                    .isBookmarked =
                                                !widget.barberShopModel
                                                    .isBookmarked;
                                            if (widget
                                                .barberShopModel.isBookmarked) {
                                              box.put(
                                                widget.barberShopModel.id,
                                                BarberShopSavedModel(
                                                  widget.barberShopModel.id,
                                                  barberShopName: widget
                                                      .barberShopModel
                                                      .barberShopName,
                                                  imageUrl: widget
                                                      .barberShopModel
                                                      .images![0]
                                                      .url,
                                                  isBookmarked: widget
                                                      .barberShopModel
                                                      .isBookmarked,
                                                ),
                                              );
                                            } else {
                                              box.delete(
                                                  widget.barberShopModel.id);
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: const BoxDecoration(
                                            color: AppColors.cardWhite,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              widget.barberShopModel
                                                      .isBookmarked
                                                  ? Icons.bookmark
                                                  : Icons.bookmark_border,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: height * 0.02,
                                      right: globallController.language == 'fa'
                                          ? width * 0.05
                                          : width * 0.72,
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
                                );
                              },
                            );
                          },
                        ),
                      ),

                      const SliverPadding(padding: EdgeInsets.only(top: 16)),

                      SliverToBoxAdapter(
                        child: Selector<BarberShopController, BlocStatus>(
                          selector: (context, controller) =>
                              controller.barberShopState,
                          builder: (context, barberShopState, child) {
                            return BarberShopTitle(
                              barberShopListState: barberShopState,
                              barberShopModel: widget.barberShopModel,
                            );
                          },
                        ),
                      ),

                      const SliverPadding(padding: EdgeInsets.only(top: 16)),
                      SliverToBoxAdapter(
                        child: Selector<BarberShopController, BlocStatus>(
                          builder: (context, barberShopState, child) {
                            return StateManageWidget(
                              status: barberShopState,
                              loadingWidget: () {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: width * 0.05,
                                      top: height * 0.01,
                                      left: width * 0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          width: width * 0.2,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.04,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 6,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5),
                                                width: width * 0.3,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: Colors.grey[300],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              errorWidgetBuilder: (message, statusCode) {
                                return Center(
                                  child: Text(message!),
                                );
                              },
                              completedWidgetBuilder: (value) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 22, left: 22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.services,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      const SizedBox(height: 15),
                                      ServiceCategories(
                                        onTabChange: (index) {},
                                        tabs: [
                                          AppLocalizations.of(context)!
                                              .hair_cut,
                                          AppLocalizations.of(context)!
                                              .hair_style,
                                          AppLocalizations.of(context)!.shaving,
                                        ],
                                        content: [
                                          Selector<BarberShopController,
                                              BlocStatus>(
                                            builder:
                                                (context, serviceState, child) {
                                              return StateManageWidget(
                                                status: serviceState,
                                                loadingWidget: () {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
                                                errorWidgetBuilder:
                                                    (message, statusCode) {
                                                  return Center(
                                                    child: Text(
                                                      message.toString(),
                                                    ),
                                                  );
                                                },
                                                completedWidgetBuilder:
                                                    (value) {
                                                  if (value.isEmpty) {
                                                    return Center(
                                                      child: Text(
                                                        'هیچ داده‌ای وجود ندارد',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge
                                                            ?.copyWith(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 16,
                                                            ),
                                                      ),
                                                    );
                                                  }
                                                  return Column(
                                                    children: [
                                                      SizedBox(
                                                        height: value.isNotEmpty
                                                            ? null
                                                            : 250.0,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          itemCount:
                                                              value.length > 3
                                                                  ? 3
                                                                  : value
                                                                      .length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            final service =
                                                                value[index];
                                                            return ServicesView(
                                                              shouldNavigate:
                                                                  true,
                                                              serviceModel:
                                                                  service,
                                                              isLastItem: (index ==
                                                                  (value.length >
                                                                          3
                                                                      ? 2
                                                                      : value.length -
                                                                          1)),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      if (value.isNotEmpty &&
                                                          value.length >
                                                              3) // اضافه کردن شرط برای نمایش دکمه
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
                                                      if (value.length >
                                                          3) // نمایش دکمه "see_more" فقط اگر تعداد آیتم‌ها بیشتر از 3 باشد
                                                        moreButton(
                                                          context,
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .see_more,
                                                          () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ServiceSelectionScreen(),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                    ],
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
                                );
                              },
                            );
                          },
                          selector: (context, controller) =>
                              controller.barberShopState,
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: height * 0.02,
                        ),
                      ),
                      const SliverPadding(padding: EdgeInsets.only(top: 32)),
                      SliverToBoxAdapter(
                        child: Selector<BarberController, BlocStatus>(
                          selector: (context, controller) =>
                              controller.barberStatus,
                          builder: (context, barberStatus, child) {
                            return StateManageWidget(
                              status: barberStatus,
                              loadingWidget: () {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: width * 0.05,
                                      top: height * 0.01,
                                      left: width * 0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          width: width * 0.24,
                                          height: 13,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          width: width * 0.2,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          width: width * 0.2,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15),
                                          width: width * 0.9,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 22, left: 22, bottom: 16),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .salon_members,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 140,
                                      child: ListView.builder(
                                        padding: const EdgeInsets.only(
                                            right: 22, left: 22),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: value.length,
                                        itemBuilder: (context, index) {
                                          final barber = value[index];
                                          return BarberArtists(
                                            barberModel: barber,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Selector<BarberShopController, BlocStatus>(
                          builder: (context, commentStatus, child) {
                            return StateManageWidget(
                              status: commentStatus,
                              loadingWidget: () {
                                return const SizedBox();
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

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 22, right: 22),
                                      child: Text(
                                        AppLocalizations.of(context)!.reviews,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 22, left: 22),
                                      child: Row(
                                        children: List.generate(
                                          5,
                                          (index) {
                                            if (widget.barberShopModel
                                                        .comments !=
                                                    null &&
                                                widget.barberShopModel.comments!
                                                    .isNotEmpty) {
                                              int rating = widget
                                                  .barberShopModel
                                                  .comments![0]
                                                  .rating
                                                  .toInt();

                                              if (index < rating) {
                                                return const Icon(Icons.star);
                                              } else {
                                                return const Icon(
                                                    Icons.star_border);
                                              }
                                            } else {
                                              return const Icon(
                                                  Icons.star_border);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 22, right: 22),
                                      child: Row(
                                        children: [
                                          Text(
                                            '4.5',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '(55)',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: AppColors.tankBlue3,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Divider(
                                      height: 1,
                                      color: AppColors.dividerColor900,
                                      indent: 22,
                                      endIndent: 22,
                                    ),
                                    SizedBox(
                                      height: widget.barberShopModel.comments!
                                                  .length >
                                              3
                                          ? 3 * 170.0
                                          : widget.barberShopModel.comments!
                                                  .length *
                                              170.0,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: widget.barberShopModel
                                                    .comments!.length >
                                                3
                                            ? 3
                                            : widget.barberShopModel.comments!
                                                .length,
                                        itemBuilder: (context, index) {
                                          final comment = widget
                                              .barberShopModel.comments![index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 22),
                                            child: UserComment(
                                              commentBarberShop: comment,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    if (widget
                                            .barberShopModel.comments!.length >=
                                        3)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 22),
                                        child: moreButton(
                                          context,
                                          AppLocalizations.of(context)!
                                              .see_more,
                                          () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewCommentsScreen(
                                                  barberShopModel:
                                                      widget.barberShopModel,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                          selector: (context, controller) =>
                              controller.commentStatus,
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
                                AppLocalizations.of(context)!.description,
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
                                AppLocalizations.of(context)!.read_all,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.tankBlue3,
                                    ),
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
                                AppLocalizations.of(context)!.working_hours,
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
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
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
                                AppLocalizations.of(context)!.location_on_map,
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
                                          widget.barberShopModel.location!
                                              .latitude!,
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
                                AppLocalizations.of(context)!.show_on_map,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.tankBlue3,
                                    ),
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
                              title:
                                  AppLocalizations.of(context)!.nearby_salons,
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
                              title:
                                  AppLocalizations.of(context)!.salons_near_you,
                              barberShopListState:
                                  barberShopController.topBarberShopState,
                              barbreShopData:
                                  barberShopController.topBarberShops,
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
                        child: ButtonService(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget moreButton(
      BuildContext context, String buttonText, VoidCallback onTapCallback) {
    return GestureDetector(
      onTap: () {
        onTapCallback();
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
              buttonText,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonService extends StatelessWidget {
  const ButtonService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 7,
        bottom: 7,
        top: 7,
        left: 7,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ServiceSelectionScreen(),
                ),
              );
            },
            child: Container(
              width: 179,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.tankBlue3,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    AppLocalizations.of(context)!.book_appointment_button,
                    style: const TextStyle(
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
          // نمایش تعداد خدمات از serviceModel
          const Text(
            '6 خدمات', // تعداد خدمات
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.tankBlue3,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class BarberShopTitle extends StatelessWidget {
  final BarberShopModel barberShopModel;
  final BlocStatus barberShopListState;

  const BarberShopTitle(
      {super.key,
      required this.barberShopModel,
      required this.barberShopListState});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return StateManageWidget(
      status: barberShopListState,
      loadingWidget: () {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: EdgeInsets.only(
                right: width * 0.05, top: height * 0.01, left: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  width: width * 0.5,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  width: width * 0.3,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: width * 0.2,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: width * 0.2,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      errorWidgetBuilder: (message, statusCode) {
        return Center(
          child: Text(message!),
        );
      },
      completedWidgetBuilder: (value) {
        return Padding(
          padding: const EdgeInsets.only(right: 22, top: 5, left: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                barberShopModel.barberShopName!,
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
      },
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
