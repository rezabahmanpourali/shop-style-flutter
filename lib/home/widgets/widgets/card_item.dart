import 'package:flutter/material.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/common/configs/colors.dart';

class CardItem extends StatelessWidget {
  final BarberShopModel barberShopModel;
  const CardItem({
    super.key, required this.barberShopModel,
  });

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
                    barberShopModel.barberShopImage ?? 'assets/images/1.jpeg',
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
                      color: AppColors.arayeshColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(barberShopModel.barberShopName!),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('(55)'),
                              Text('4.9'),
                              Icon(Icons.star),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Text('قم، پردیسان'),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.cardWhite,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 23,
                          width: 74,
                          child: const Center(
                            child: Text(
                              'آرایشگاه',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
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
