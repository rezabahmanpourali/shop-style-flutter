import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/locator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Draggableitems extends StatefulWidget {
  Draggableitems({super.key});

  @override
  State<Draggableitems> createState() => _DraggableitemsState();
}

class _DraggableitemsState extends State<Draggableitems> {
  BarberShopController barberShopController =
      locator.get<BarberShopController>();

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.9);
    int? selectedMarkerIndex;

    return Column(
      children: [
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
                  if (selectedMarkerIndex == null) {
                    Container(
                      margin: const EdgeInsets.only(
                        left: 22,
                        right: 22,
                        bottom: 20,
                      ),
                      color: AppColors.activeSwitchColor,
                      height: 220,
                      width: 100,
                      child: const Center(
                        child: Text('چیزی انتخاب نشده'),
                      ),
                    );
                  }
                },
              ),
            ),
            if (selectedMarkerIndex != null)
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
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Row(
            children: [
              if (selectedMarkerIndex != null) ...[
                Text(barberShopController
                    .barberShops[selectedMarkerIndex!].barberShopName!),
              ],
              const Spacer(),
              if (selectedMarkerIndex != null)
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
                    ?.copyWith(color: AppColors.purpleOpacity),
              ),
              const SizedBox(width: 5),
              Text(
                'کیلومتر',
                style: Theme.of(context).textTheme.labelMedium,
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
          padding: const EdgeInsets.only(right: 22),
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
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 1,
          color: AppColors.dividerColor900,
          indent: 22,
          endIndent: 22,
        ),
        const SizedBox(height: 16),
        ModellMoForShop(context: context),
        const SizedBox(height: 16),
        ModellMoForShop(context: context),
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
    );
  }
}

class ModellMoForShop extends StatelessWidget {
  const ModellMoForShop({
    super.key,
    required this.context,
  });

  final BuildContext context;

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
                'مدل موی خامه ای',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 16,
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
