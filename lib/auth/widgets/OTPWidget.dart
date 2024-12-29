import 'package:flutter/material.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({
    super.key,
    this.topPadding,
  });

  final double? topPadding;

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding ?? 0),
      child: Container(
        height: height / 20,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(Radius.circular(360)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              oneNumberCode(width, controller1, focusNode1, context, null),
              oneNumberCode(
                  width, controller2, focusNode2, context, focusNode1),
              oneNumberCode(
                  width, controller3, focusNode3, context, focusNode2),
              oneNumberCode(
                  width, controller4, focusNode4, context, focusNode3),
            ],
          ),
        ),
      ),
    );
  }

  Widget oneNumberCode(
    double width,
    TextEditingController controller,
    FocusNode focusNode,
    BuildContext context,
    FocusNode? previousFocusNode,
  ) {
    return SizedBox(
      width: width / 20,
      child: TextField(
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          counterText: ' ',
          border: InputBorder.none,
          hintText: '_',
          hintStyle: TextStyle(
            color: Color(0xFF000000),
            fontSize: 18,
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            if (previousFocusNode != null) {
              FocusScope.of(context).requestFocus(previousFocusNode);
            }
          }
        },
      ),
    );
  }
}
