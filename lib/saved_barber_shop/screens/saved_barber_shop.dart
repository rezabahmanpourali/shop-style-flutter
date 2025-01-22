import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/app_localizations.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/barber_shop_saved_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/home/widgets/barber_shop_list_widgets.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';
import 'package:shop_style/locator.dart';

class SavedBarberShop extends StatefulWidget {
  const SavedBarberShop({
    super.key,
  });

  @override
  State<SavedBarberShop> createState() => _SavedBarberShopState();
}

class _SavedBarberShopState extends State<SavedBarberShop> {
  BarberShopController barberShopController =
      locator.get<BarberShopController>();
  @override
  Widget build(BuildContext context) {
    var box = Hive.box<BarberShopSavedModel>('CardBox');
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22, bottom: 32),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های ذخیره شده'),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 250,
                  child: ValueListenableBuilder(
                    valueListenable: box.listenable(),
                    builder: (context, Box<BarberShopSavedModel> box, _) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(left: 22),
                        scrollDirection: Axis.horizontal,
                        itemCount: box.isEmpty ? 0 : box.length,
                        itemBuilder: (context, index) {
                          var barberShopSavedModel = box.getAt(index);

                          BarberShopModel barberShopModel = BarberShopModel(
                            id: barberShopSavedModel!.id,
                            barberShopName: barberShopSavedModel.barberShopName,
                            images: barberShopSavedModel.imageUrl != null
                                ? [
                                    ImageModel(
                                        url: barberShopSavedModel.imageUrl)
                                  ]
                                : [],
                            isBookmarked: barberShopSavedModel.isBookmarked,
                            comments: barberShopSavedModel.comments ?? [],
                            location: barberShopSavedModel.location ??
                                Location(latitude: 0.0, longitude: 0.0),
                            shopType: barberShopSavedModel.shopType ?? '',
                            isActive: barberShopSavedModel.isActive ?? true,
                          );

                          return Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MultiProvider(
                                        providers: [
                                          ChangeNotifierProvider.value(
                                            value:
                                                locator.get<BarberController>(),
                                          ),
                                          ChangeNotifierProvider.value(
                                            value: locator
                                                .get<BarberShopController>(),
                                          ),
                                        ],
                                        child: BarberShopPage(
                                          barberShopModel: barberShopModel,
                                          barberShopId: barberShopModel.id ?? 0,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: CardItem(barberShopModel),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های برتر'),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(right: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های منطقه شما'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedCardItems extends StatefulWidget {
  final BarberShopSavedModel barberShopSavedModel;
  final Box<BarberShopSavedModel> box;
  final int index;

  const SavedCardItems({
    required this.barberShopSavedModel,
    required this.box,
    required this.index,
    super.key,
  });

  @override
  State<SavedCardItems> createState() => _SavedCardItemsState();
}

class _SavedCardItemsState extends State<SavedCardItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 214,
          height: 242,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 1, color: AppColors.cardWhite),
          ),
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                  child: Image.network(
                    widget.barberShopSavedModel.imageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12, top: 8, left: 12),
                          child: Text(
                            widget.barberShopSavedModel.barberShopName ??
                                'نام آرایشگاه',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12, top: 5, left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.star),
                              Text(
                                '4.9',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Text('(55)'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          child: Text(
                            'قم، پردیسان',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 8, bottom: 12, left: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.cardWhite,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              height: 23,
                              width: 74,
                              child: Center(
                                child: Text(
                                  'آرایشگاه',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          fontSize: 14, color: AppColors.black),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.box.deleteAt(widget.index);
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 8, bottom: 12, left: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.red),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                height: 23,
                                width: 74,
                                child: Center(
                                  child: Text(
                                    'حذف',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                  ),
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
            ],
          ),
        ),
      ],
    );
  }
}
