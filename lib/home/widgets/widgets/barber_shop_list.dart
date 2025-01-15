import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/widgets/widgets/card_item.dart';
import 'package:shop_style/locator.dart';

class BarberShopList extends StatefulWidget {
  final BlocStatus barberShopListState;
  final List<BarberShopModel> barbreShopData;

  final String title;
  const BarberShopList(
      {super.key,
      required this.barberShopListState,
      required this.barbreShopData,
      required this.title});

  @override
  State<BarberShopList> createState() => _BarberShopListState();
}

class _BarberShopListState extends State<BarberShopList> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return StateManageWidget(
      status: widget.barberShopListState,
      loadingWidget: () {
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
                  margin: const EdgeInsets.only(right: 10),
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
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            //آیتم های کارد
            SizedBox(
              height: 242,
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 22),
                scrollDirection: Axis.horizontal,
                itemCount: widget.barbreShopData.length,
                itemBuilder: (context, index) {
                  final barberShop = widget.barbreShopData[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return MultiProvider(
                                providers: [
                                  ChangeNotifierProvider.value(
                                    value: locator.get<BarberController>(),
                                  ),
                                  ChangeNotifierProvider.value(
                                    value: locator.get<BarberShopController>(),
                                  ),
                                ],
                                child: Builder(
                                  builder: (context) => BarberShopPage(
                                    barberShopModel: barberShop,
                                    barberShopId: barberShop.id ?? 0,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: CardItem(barberShop),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}