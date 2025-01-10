import 'package:flutter/material.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/common/configs/colors.dart';

class CardItem extends StatelessWidget {
  final BarberShopModel barberShopModel;
  const CardItem(
    this.barberShopModel,
  );

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
                    barberShopModel.images!.isNotEmpty
                        ? barberShopModel.images![0].url!
                        : 'assets/images/1.jpeg',
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
                          padding: const EdgeInsets.only(right: 12, top: 8),
                          child: Text(barberShopModel.barberShopName!,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12, top: 5),
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
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            'قم، پردیسان',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 12),
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
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
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
