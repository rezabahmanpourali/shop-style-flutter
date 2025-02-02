import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/model/barber_shop_saved_model.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن
import 'package:shimmer/shimmer.dart';

class RecentlySeenBarberShopsWidget extends StatelessWidget {
  final Box<BarberShopSavedModel> recentVisitsBox;
  final BlocStatus barberShopState; // اضافه کردن وضعیت

  const RecentlySeenBarberShopsWidget({
    Key? key,
    required this.recentVisitsBox,
    required this.barberShopState, // دریافت وضعیت
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StateManageWidget(
      status: barberShopState, // استفاده از وضعیت لودینگ
      loadingWidget: () {
        // نمایش شیمر زمانی که داده‌ها در حال بارگذاری هستند
        return SizedBox(
          height: height * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: const EdgeInsets.only(right: 22, left: 22),
                  width: width * 0.45,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.482,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.9,
                      child: BigShimer(height: height, width: width),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      errorWidgetBuilder: (message, statusCode) {
        return Center(
          child: Text(message ?? 'خطا'),
        );
      },
      completedWidgetBuilder: (value) {
        // زمانی که داده‌ها بارگذاری شدند
        return ValueListenableBuilder(
          valueListenable: recentVisitsBox.listenable(),
          builder: (context, Box<BarberShopSavedModel> box, _) {
            if (box.isEmpty) {
              return const SizedBox();
            }
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 22, right: 22, bottom: 19),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.recently_seen,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 22),
                    scrollDirection: Axis.horizontal,
                    itemCount: box.isEmpty ? 0 : box.length,
                    itemBuilder: (context, index) {
                      var barberShopSavedModel = box.getAt(index);

                      // ساخت مدل BarberShop
                      BarberShopModel barberShopModel = BarberShopModel(
                        id: barberShopSavedModel!.id,
                        barberShopName: barberShopSavedModel.barberShopName,
                        images: barberShopSavedModel.imageUrl != null
                            ? [ImageeModel(url: barberShopSavedModel.imageUrl)]
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
                            // ذخیره آرایشگاه در "بازدیدهای اخیر"
                            _saveToRecentlyViewed(barberShopSavedModel);

                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return MultiProvider(
                                    providers: [
                                      ChangeNotifierProvider.value(
                                        value:
                                            locator.get<BarberShopController>(),
                                      ),
                                    ],
                                    child: BarberShopPage(
                                      barberShopModel: barberShopModel,
                                      barberShopId: barberShopModel.id ?? 0,
                                    ),
                                  );
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  // انیمیشن به سمت بالا
                                  var begin = Offset(0.0, 1.0); // شروع از پایین
                                  var end = Offset.zero; // پایان در وسط
                                  var curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                      position: offsetAnimation, child: child);
                                },
                              ),
                            );
                          },
                          child: CardItem(barberShopModel),
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
    );
  }

  void _saveToRecentlyViewed(BarberShopSavedModel barberShop) {
    // ذخیره آرایشگاه در بازدیدهای اخیر (برای زمانی که در فروشگاه‌های ذخیره‌شده نیست)
  }
}
