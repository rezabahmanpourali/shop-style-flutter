import 'package:flutter/material.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/common/configs/colors.dart';

class BarberArtists extends StatelessWidget {
  final BarberModel barberModel;
  const BarberArtists({super.key, required this.barberModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 120,
          width: 91,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset('assets/images/img8.png'),
                ),
              ),
              Positioned(
                top: 60,
                left: 25,
                child: Container(
                  width: 55,
                  height: 19,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: AppColors.cardWhite,
                    ),
                    color: AppColors.white2,
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('4.5',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontSize: 14)),
                      const Icon(Icons.star, size: 11),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 82,
                left: 20,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      barberModel.barberName!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'متخصص رنگ مو',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
