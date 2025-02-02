import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.lableField,
    required this.type,
    this.hintText,
    this.topPadding,
    this.controller,
    this.inputType = TextInputType.text, // نوع ورودی رو از بیرون تعیین کن
    this.inputFormatter,
    this.textDirection = TextDirection.ltr, // اضافه کردن پارامتر textDirection
  });

  final String? lableField;
  final String? hintText;
  final TextfieldType type;
  final double? topPadding;
  final TextEditingController? controller;
  final TextInputType inputType; // برای نوع ورودی
  final List<TextInputFormatter>?
      inputFormatter; // برای فرمت ورودی‌ها (مثل فقط اعداد)
  final TextDirection textDirection; // پارامتر جدید برای تعیین جهت متن

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool showPassword = true;
  bool hasSecurity = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding ?? 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.lableField ?? '',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                  ),
            ),
            SizedBox(height: height / 100),
            Container(
              height: height / 18,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.onBoardColor, width: 1),
                color: AppColors.white2,
                borderRadius: const BorderRadius.all(Radius.circular(360)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 40),
                child: getComponents(width),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getComponents(width) {
    switch (widget.type) {
      case TextfieldType.none:
        return getTextfield(width);
      case TextfieldType.numberPhone:
        return Row(
          children: [
            getNumberPhoneIcon(context),
            SizedBox(width: width / 40),
            getTextfield(width),
          ],
        );

      case TextfieldType.security:
        return Row(
          children: [
            getTextfield(width),
            getIconShowPassword(),
          ],
        );
    }
  }

  Widget getTextfield(width) {
    return SizedBox(
      width: widget.type == TextfieldType.none
          ? width / 1.3
          : widget.type == TextfieldType.numberPhone
              ? width / 1.5
              : width / 1.45,
      child: TextField(
        keyboardType:
            widget.inputType, // استفاده از نوع ورودی مشخص شده از بیرون
        inputFormatters: widget.inputFormatter ?? [],
        controller: widget.controller,
        obscureText: widget.type == TextfieldType.security &&
            showPassword, // مخفی کردن متن در صورت نیاز
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText ?? '',
          hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.cardWhite,
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
        ),
        textDirection: widget.textDirection,
      ),
    );
  }

  Widget getNumberPhoneIcon(BuildContext context) {
    final globalController = Provider.of<GlobalController>(context);
    bool isLanguageFarsi =
        globalController.language == 'fa' || globalController.language == 'ar';

    return Icon(
      isLanguageFarsi ? Icons.phone_enabled_rounded : Icons.phone,
      color: AppColors.onBoardColor,
      size: 40,
    );
  }

  Widget getIconShowPassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          showPassword = !showPassword; // تغییر وضعیت نمایش پسورد
        });
      },
      icon: Icon(
        showPassword ? Icons.visibility : Icons.visibility_off,
        color: Color(0xFFBABABA),
        size: 30,
      ),
    );
  }
}
