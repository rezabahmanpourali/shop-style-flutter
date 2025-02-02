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
                padding: EdgeInsets.only(right: 22, bottom: 22),
                sliver: SliverToBoxAdapter(
                  child: Text('آرایشگاه های برتر'),
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
                                    ImageeModel(
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
