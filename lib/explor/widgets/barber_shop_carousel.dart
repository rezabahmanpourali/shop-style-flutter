import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/services_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/locator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class BarberShopCarousel extends StatefulWidget {
  final BarberShopModel barberShopModel;
  final PageController controller;
  final int? selectedMarkerIndex;
  final BarberShopController barberShopController;

  const BarberShopCarousel({
    super.key,
    required this.controller,
    required this.selectedMarkerIndex,
    required this.barberShopController,
    required this.barberShopModel, 
  });

  @override
  State<BarberShopCarousel> createState() => _BarberShopCarouselState();
}

class _BarberShopCarouselState extends State<BarberShopCarousel> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        widget.barberShopController
            .fetchServic(widget.barberShopModel.id); // بارگذاری خدمات
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          '3 آرایشگاه نزدیک',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: AppColors.textHeader),
        ),
        const SizedBox(height: 16),
        Stack(
          children: [
            SizedBox(
              height: height * 0.3,
              child: PageView.builder(
                controller: widget.controller,
                itemCount: widget.barberShopModel.images?.length,
                itemBuilder: (context, index) {
                  if (widget.selectedMarkerIndex == null) {
                    return GestureDetector(
                      onTap: () {
                        final selectBarberShop =
                            widget.selectedMarkerIndex == null
                                ? widget.barberShopModel
                                : widget.barberShopController
                                    .barberShops[widget.selectedMarkerIndex!];
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return MultiProvider(
                                providers: [
                                  ChangeNotifierProvider.value(
                                      value: locator.get<BarberController>()),
                                  ChangeNotifierProvider.value(
                                      value:
                                          locator.get<BarberShopController>()),
                                ],
                                child: BarberShopPage(
                                  barberShopModel: selectBarberShop,
                                  barberShopId: selectBarberShop.id ?? 0,
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
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          bottom: 20,
                          right: 20,
                        ),
                        width: double.infinity,
                        child: widget.selectedMarkerIndex == null
                            ? widget.barberShopController.barberShops.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      widget.barberShopModel.images![0].url
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container()
                            : Image.network(
                                widget.barberShopModel.images![0].url
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                      ),
                    );
                  }

                  if (widget.selectedMarkerIndex != null) {
                    return GestureDetector(
                      onTap: () {
                        final selectBarberShop = widget.barberShopController
                            .barberShops[widget.selectedMarkerIndex!];

                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return MultiProvider(
                                providers: [
                                  ChangeNotifierProvider.value(
                                      value: locator.get<BarberController>()),
                                  ChangeNotifierProvider.value(
                                      value:
                                          locator.get<BarberShopController>()),
                                ],
                                child: BarberShopPage(
                                  barberShopModel: selectBarberShop,
                                  barberShopId: selectBarberShop.id ?? 0,
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
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 22, right: 22, bottom: 20),
                        height: 220,
                        width: double.infinity,
                        child: widget.selectedMarkerIndex == null
                            ? widget.barberShopController.barberShops.isNotEmpty
                                ? Image.network(
                                    widget.barberShopModel.images![0].url
                                        .toString(),
                                    fit: BoxFit.cover,
                                  )
                                : Container()
                            : Image.network(
                                widget.barberShopModel.images![0].url
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
            if (widget.selectedMarkerIndex != null)
              Positioned(
                bottom: 30,
                right: 180,
                child: SmoothPageIndicator(
                  controller: widget.controller,
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
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Row(
            children: [
              Text(
                widget.barberShopModel.barberShopName!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                    ),
              ),
              const SizedBox(height: 16),
              const Spacer(),
              if (widget.selectedMarkerIndex != null)
                Text(
                  'حدود',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16),
                ),
              const SizedBox(width: 5),
              Text(
                '5',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.purpleOpacity),
              ),
              const SizedBox(width: 5),
              Text(
                'کیلومتر',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Padding(
          padding: EdgeInsets.only(
            right: (Provider.of<GlobalController>(context).language == 'fa')
                ? 22
                : 0,
            left: (Provider.of<GlobalController>(context).language == 'fa')
                ? 0
                : 22,
          ),
          child: Row(
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
        ),
        const SizedBox(width: 7),
        Padding(
          padding: EdgeInsets.only(
            right: (Provider.of<GlobalController>(context).language == 'fa')
                ? 22
                : 0,
            left: (Provider.of<GlobalController>(context).language == 'fa')
                ? 0
                : 22,
          ),
          child: Row(
            children: [
              Text(
                'قم، پردیسان، آدرس آرایشگاه',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16, color: AppColors.textSearchColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Divider(
          height: 1,
          color: AppColors.dividerColor900,
          indent: 22,
          endIndent: 22,
        ),
        const SizedBox(height: 16),
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
                  child: Text(message.toString()),
                );
              },
              completedWidgetBuilder: (value) {
                if (value.isEmpty) {
                  return Center(
                    child: Text(
                      'هیچ داده‌ای وجود ندارد',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                    ),
                  );
                }
                return Column(
                  children: [
                    SizedBox(
                      height: value.isNotEmpty ? null : 250,
                      child: ListView.builder(
                        itemCount: value.length > 3
                            ? 3
                            : value.length, // فقط 3 خدمت اول را نمایش دهید
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final service = value[index];
                          return ModellMoForShopWidget(
                            serviceModel: service,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          },
          selector: (context, controller) => controller.servicState,
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(
            right: (Provider.of<GlobalController>(context).language == 'fa')
                ? 22
                : 0,
            left: (Provider.of<GlobalController>(context).language == 'fa')
                ? 0
                : 22,
          ),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.see_more,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.purpleOpacity,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class ModellMoForShopWidget extends StatelessWidget {
  final ServiceModel serviceModel;

  const ModellMoForShopWidget({
    super.key,
    required this.serviceModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceModel.hairModel.name,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.av_timer, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    '40 دقیقه',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            serviceModel.price.toString(),
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
