import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    this.lableField,
    required this.type,
    this.hintText,
    this.topPadding,
  });

  final String? lableField;
  final String? hintText;
  final TextfieldType type;
  final double? topPadding;

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
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.black),
            ),
            SizedBox(height: height / 100),
            Container(
              height: height / 18,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.bgGrey, width: 2),
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
            getNumberPhoneIcon(),
            SizedBox(width: width / 40),
            getTextfield(width),
          ],
        );

      case TextfieldType.security:
        return Row(
          children: [
            getTextfield(width),
            getIconShowPasword(),
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
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText ?? '',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.hintTextColor),
        ),
      ),
    );
  }

  Widget getNumberPhoneIcon() {
    return const Icon(
      Icons.phone_enabled_rounded,
      color: AppColors.bgGrey,
      size: 40,
    );
  }

  Widget getIconShowPasword() {
    if (showPassword) {
      return IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: const Icon(
          Icons.visibility,
          color: Color(0xFFBABABA),
          size: 30,
        ),
      );
    } else {
      return IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: const Icon(
          Icons.visibility_off,
          color: Color(0xFFBABABA),
          size: 30,
        ),
      );
    }
  }
}
