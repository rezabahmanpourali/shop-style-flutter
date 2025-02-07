import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/home/models/barber_hair_model.dart';

class CardItemParty extends StatelessWidget {
  final HairModel hairModel;
  const CardItemParty(
    this.hairModel,
  );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => BarberShopPage(),
        //   ),
        // );
      },
      child: Container(
        width: 132,
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
                child: Stack(
                  children: [
                    Image.network(
                      hairModel.images.isNotEmpty
                          ? hairModel.images[0].url ??
                              'https://via.placeholder.com/150'
                          : 'https://via.placeholder.com/150',
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 50,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: AppColors.white2,
                          // .withValues(alpha: 100),
                          borderRadius: BorderRadius.all(
                            Radius.circular(27),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '22%',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.purpleOpacity,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                    color: AppColors.white2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 16
                              : 0,
                          left: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 0
                              : 16,
                          top: 12,
                        ),
                        child: Text(
                          hairModel.name!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 16
                              : 0,
                          left: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 0
                              : 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.star),
                            Text(
                              '4.9',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const Text(
                              '(55)',
                              style: TextStyle(color: AppColors.tankBlue3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 16
                              : 0,
                          left: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 0
                              : 16,
                        ),
                        child: Text(
                          'نام آرایشگاه',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 16
                              : 0,
                          left: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 0
                              : 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 29,
                              height: 14,
                              decoration: const BoxDecoration(
                                color: AppColors.tankBlue3,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(27),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '22%',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.cardWhiteTakhfif,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '189,000',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    decoration:
                                        TextDecoration.lineThrough, // خط خوردگی
                                  ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('تومان',
                                style:
                                    Theme.of(context).textTheme.displayMedium!),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 16
                              : 0,
                          left: (Provider.of<GlobalController>(context)
                                      .language ==
                                  'fa')
                              ? 0
                              : 16,
                        ),
                        child: Row(
                          children: [
                            Text(' 139,000',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 14,
                                    )),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('تومان',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 14,
                                    )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
