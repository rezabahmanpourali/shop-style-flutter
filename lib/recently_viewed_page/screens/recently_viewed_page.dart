import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/barber_shop_saved_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:provider/provider.dart';

class RecentlyViewedPage extends StatefulWidget {
  const RecentlyViewedPage({super.key});

  @override
  State<RecentlyViewedPage> createState() => _RecentlyViewedPageState();
}

class _RecentlyViewedPageState extends State<RecentlyViewedPage> {
  late Box<BarberShopSavedModel> recentVisitsBox;
  late Box<BarberShopSavedModel> savedBarbersBox;

  @override
  void initState() {
    super.initState();
    savedBarbersBox = Hive.box<BarberShopSavedModel>('CardBox');
    recentVisitsBox = Hive.box<BarberShopSavedModel>('recentVisitsBox');
  }

  // تابع برای ذخیره کردن آرایشگاه‌ها در "بازدیدهای اخیر" اگر در "فروشگاه‌های ذخیره‌شده" نباشد
  void _saveToRecentlyViewed(BarberShopSavedModel barberShop) {
    var existingSavedShop = savedBarbersBox.get(barberShop.id);
    if (existingSavedShop == null) {
      recentVisitsBox.put(barberShop.id, barberShop);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // تنظیم جهت متن به راست
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(),
                const SliverPadding(
                  padding: EdgeInsets.only(right: 22, bottom: 22),
                  sliver: SliverToBoxAdapter(
                    child: Text('بازدید های اخیر'),
                  ),
                ),
                // نمایش آرایشگاه‌های بازدید شده
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 250,
                    child: ValueListenableBuilder(
                      valueListenable: recentVisitsBox.listenable(),
                      builder: (context, Box<BarberShopSavedModel> box, _) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(left: 22),
                          scrollDirection: Axis.horizontal,
                          itemCount: box.isEmpty ? 0 : box.length,
                          itemBuilder: (context, index) {
                            var barberShopSavedModel = box.getAt(index);

                            // ساخت مدل BarberShop
                            BarberShopModel barberShopModel = BarberShopModel(
                              id: barberShopSavedModel!.id,
                              barberShopName:
                                  barberShopSavedModel.barberShopName,
                              images: barberShopSavedModel.imageUrl != null
                                  ? [
                                      ImageModel(
                                        url: barberShopSavedModel.imageUrl,
                                      )
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
                                  // ذخیره آرایشگاه در "بازدیدهای اخیر" فقط اگر در "فروشگاه‌های ذخیره‌شده" نباشد
                                  _saveToRecentlyViewed(barberShopSavedModel);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MultiProvider(
                                          providers: [
                                            ChangeNotifierProvider.value(
                                              value: locator
                                                  .get<BarberShopController>(),
                                            ),
                                          ],
                                          child: BarberShopPage(
                                            barberShopModel: barberShopModel,
                                            barberShopId:
                                                barberShopModel.id ?? 0,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: CardItem(
                                    barberShopModel), // ویجت مربوط به نمایش هر آرایشگاه
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
