import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class BarberShopList extends StatelessWidget {
  const BarberShopList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.dividerColor900,
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 66,
                  height: 66,
                  child: Image.asset(
                    'assets/images/uuacu.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'نام آرایشگاه',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_back_ios,
                textDirection: TextDirection.ltr,
                size: 15,
              )
            ],
          ),
        ),
      ],
    );
  }
}
