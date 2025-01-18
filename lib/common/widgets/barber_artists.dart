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
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: ClipOval(
                    child: barberModel.images != null &&
                            barberModel.images!.isNotEmpty
                        ? Image.network(
                            barberModel.images![0].url ??
                                'assets/images/img8.png',
                            fit: BoxFit.cover,
                            width: 75,
                            height: 75,
                          )
                        : Image.asset(
                            'assets/images/img8.png',
                            fit: BoxFit.cover,
                            width: 75,
                            height: 75,
                          ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 18,
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
                      Text(
                        '4.5',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14,
                                ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.star, size: 11),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 82,
                left: 5,
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
