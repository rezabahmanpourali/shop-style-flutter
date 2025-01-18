import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class ReserveServise extends StatefulWidget {
  const ReserveServise({
    super.key,
    required this.type,
  });

  final TypeReserveServise type;

  @override
  State<ReserveServise> createState() => _ReserveServiseState();
}

class _ReserveServiseState extends State<ReserveServise> {
  bool hasReserved = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height / 40),
      child: Column(
        children: [
          getElemans(widget.type, height, width),
          SizedBox(height: height / 60),
          const Divider(
            height: 1,
            color: AppColors.dividerColor900,
            endIndent: 22,
            indent: 22,
          ),
        ],
      ),
    );
  }

  Widget getElemans(TypeReserveServise type, double height, double width) {
    switch (type) {
      case TypeReserveServise.reserve:
        return Row(
          children: [
            getTextModell(height, width),
            const Spacer(),
            hasReserved
                ? reserved(hasReserved)
                : notReserved(height, width, hasReserved),
          ],
        );

      case TypeReserveServise.modell:
        return Row(
          children: [
            getTextModell(height, width),
            const Spacer(),
            Image.asset('assets/images/images (2) 1.png'),
          ],
        );

      case TypeReserveServise.hairdresser:
        return Row(
          children: [
            getTextHairdresser(height, width),
            const Spacer(),
            Image.asset('assets/images/images (2) 1.png'),
          ],
        );
    }
  }

  Widget getTextHairdresser(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نام آرایشگر',
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16),
        ),
        SizedBox(height: height / 80),
        Text(
          'متخصص مدل مو و کوتاهی',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: AppColors.textHeader, fontSize: 16),
        ),
      ],
    );
  }

  Widget getTextModell(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'مدل موی خامه ای',
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 16),
        ),
        SizedBox(height: height / 400),
        Row(
          children: [
            const Icon(
              Icons.access_time_outlined,
              color: Color(0xFF757676),
              size: 14,
            ),
            SizedBox(width: width / 60),
            Text(
              '40 دقیقه',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppColors.textHeader, fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: height / 400),
        Text(
          '125,000 تومان',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: AppColors.textHeader, fontSize: 16),
        ),
      ],
    );
  }

  Widget reserved(hasReserved) {
    return IconButton(
      onPressed: () {
        getClick();
      },
      icon: const Icon(
        Icons.check_circle,
        color: Color(0xFF000080),
        size: 35,
      ),
    );
  }

  Widget notReserved(height, width, hasReserved) {
    return Container(
      height: height / 20,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(360)),
      ),
      child: ElevatedButton(
        onPressed: () {
          getClick();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFFFFF),
          minimumSize: Size(width / 4, height / 20),
          elevation: 0,
        ),
        child: Text(
          AppLocalizations.of(context)!.book_appointment,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: AppColors.black, fontSize: 16),
        ),
      ),
    );
  }

  void getClick() {
    setState(() {
      hasReserved = !hasReserved;
    });
  }
}
