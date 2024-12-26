import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.lableField,
  });

  final String lableField;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.lableField,
            style: const TextStyle(color: Color(0xFF000000), fontSize: 14),
          ),
          SizedBox(height: height / 100),
          Container(
            height: height / 20,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
              color: const Color(0xFFFFFFFF),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: DropdownButton<String>(
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Color(0xFF000000),
                size: 30,
              ),
              value: selectedValue,
              items: <String>['زرد', 'قرمز', 'سبز', 'آبی'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width/20),
                    child: Stack(
                      children: [
                        SizedBox(width: width / 1.5),
                        Text(
                          value,
                          style: const TextStyle(
                              color: Color(0xFF000000), fontSize: 14),
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
    );
  }
}
