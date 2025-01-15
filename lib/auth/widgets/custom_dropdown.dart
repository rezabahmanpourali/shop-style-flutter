import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.lableField,
    this.topPadding,
  });

  final String lableField;
  final double? topPadding;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue = 'زرد';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: widget.topPadding ?? 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.lableField,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.black,
                    fontSize: 12,
                  ),
            ),
            SizedBox(height: height / 100),
            Container(
              height: height / 18,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.bgGrey, width: 2),
                color: AppColors.white2,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: DropdownButton<String>(
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.black,
                  size: 30,
                ),
                value: selectedValue,
                items:
                    <String>['زرد', 'قرمز', 'سبز', 'آبی'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Stack(
                        children: [
                          SizedBox(width: width / 1.5),
                          Text(
                            value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
