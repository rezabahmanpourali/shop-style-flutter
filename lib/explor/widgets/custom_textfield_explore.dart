import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomTextFieldExplore extends StatelessWidget {
  final String title;
  final Widget icon;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Widget? leftIcon;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final bool isTextField;
  final VoidCallback? onTab;

  const CustomTextFieldExplore({
    super.key,
    required this.title,
    required this.icon,
    required this.width,
    required this.height,
    this.onChange,
    this.margin,
    this.controller,
    this.leftIcon,
    this.isTextField = false, this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            width: 1,
            color: AppColors.cardWhite,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 17),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 13),
              Expanded(
                child: isTextField
                    ? GestureDetector(
                        onTap: () {
                          print('object');
                        },
                        child: TextField(
                          controller: controller,
                          onChanged: onChange,
                          decoration: InputDecoration(
                            hintText: title,
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    : Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
              ),
              if (leftIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: leftIcon!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
