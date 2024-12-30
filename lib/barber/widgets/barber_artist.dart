import 'package:flutter/material.dart';
import 'package:shop_style/barber/model/barber_model.dart';
import 'package:shop_style/common/configs/colors.dart';

class BarberArtists extends StatelessWidget {
  final BarberModel barbers;
  const BarberArtists({
    super.key,
    required this.barbers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 91,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: SizedBox(
                  width: 91,
                  height: 91,
                  child: Image.asset('assets/images/img8.png'),
                ),
              ),
              Positioned(
                top: 78,
                left: 19,
                right: 18,
                child: Container(
                  width: 54,
                  height: 23,
                  decoration: const BoxDecoration(
                    color: AppColors.white2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('4.5'),
                      Icon(Icons.star),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      barbers.barberName!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    const Text(
                      'متخصص رنگ مو',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textHeader,
                      ),
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
