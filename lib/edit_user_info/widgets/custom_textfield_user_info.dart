import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFieldUserInfo extends StatelessWidget {
  const CustomTextFieldUserInfo({
    super.key,
    required this.lablelText,
    required this.hintText,
    required this.onChange,
    required this.keyboardType,
  });
  final String lablelText;
  final String hintText;
  final Function(String) onChange;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: AppColors.cardWhite,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lablelText,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: keyboardType,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.pen,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
