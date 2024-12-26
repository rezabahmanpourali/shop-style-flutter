import 'package:flutter/material.dart';
import 'package:shop_style/home/widgets/newWidget/enums/textfield_type.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.height,
    required this.width,
    required this.hasSecurity,
    required this.showPassword,
    required this.lableField,
    required this.type,
  });

  final double height;
  final double width;
  final bool hasSecurity;
  final bool showPassword;
  final String lableField;
  final TextfieldType type;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool showPassword = true;
  bool hasSecurity = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.lableField,
              style: const TextStyle(color: Color(0xFF000000), fontSize: 14),
            ),
            SizedBox(height: widget.height / 100),
            Container(
              height: widget.height / 20,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
                color: const Color(0xFFFFFFFF),
                borderRadius: const BorderRadius.all(Radius.circular(360)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.width / 40),
                child: Row(
                  children: [
                    getTextField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTextField() {
    switch (widget.type) {
      case TextfieldType.none:
        return getTextfield();
      case TextfieldType.numberPhone:
        return Row(
          children: [
            getNumberPhoneIcon(),
            getTextfield(),
          ],
        );

      case TextfieldType.security:
        return Row(
          children: [
            getTextfield(),
            getIconShowPasword(),
          ],
        );

      default:
    }
  }

  Widget getTextfield() {
    return SizedBox(
      width: widget.type == TextfieldType.none
          ? widget.width / 1.3
          : widget.width / 1.51,
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Color(0xFFBABABA),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget getNumberPhoneIcon() {
    return const Icon(
      Icons.phone_enabled_rounded,
      color: Color(0xFFBABABA),
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
