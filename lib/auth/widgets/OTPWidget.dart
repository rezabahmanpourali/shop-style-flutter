import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_style/common/configs/colors.dart';

// class OTPWidget extends StatefulWidget {
//   const OTPWidget({
//     super.key,
//     this.topPadding,
//     required TextEditingController otpController,
//   });

//   final double? topPadding;

//   @override
//   State<OTPWidget> createState() => _OTPWidgetState();
// }

// class _OTPWidgetState extends State<OTPWidget> {
//   TextEditingController controller1 = TextEditingController();
//   TextEditingController controller2 = TextEditingController();
//   TextEditingController controller3 = TextEditingController();
//   TextEditingController controller4 = TextEditingController();
//   FocusNode focusNode1 = FocusNode();
//   FocusNode focusNode2 = FocusNode();
//   FocusNode focusNode3 = FocusNode();
//   FocusNode focusNode4 = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: EdgeInsets.only(top: widget.topPadding ?? 0),
//       child: Container(
//         height: height / 20,
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
//           color: const Color(0xFFFFFFFF),
//           borderRadius: const BorderRadius.all(Radius.circular(360)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: width / 40),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               oneNumberCode(width, controller1, focusNode1, context, null),
//               oneNumberCode(
//                   width, controller2, focusNode2, context, focusNode1),
//               oneNumberCode(
//                   width, controller3, focusNode3, context, focusNode2),
//               oneNumberCode(
//                   width, controller4, focusNode4, context, focusNode3),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget oneNumberCode(
//     double width,
//     TextEditingController controller,
//     FocusNode focusNode,
//     BuildContext context,
//     FocusNode? previousFocusNode,
//   ) {
//     return SizedBox(
//       width: width / 20,
//       child: TextField(
//         focusNode: focusNode,
//         keyboardType: TextInputType.number,
//         controller: controller,
//         maxLength: 1,
//         textAlign: TextAlign.center,
//         decoration: const InputDecoration(
//           counterText: ' ',
//           border: InputBorder.none,
//           hintText: '_',
//           hintStyle: TextStyle(
//             color: Color(0xFF000000),
//             fontSize: 18,
//           ),
//         ),
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           } else if (value.isEmpty) {
//             if (previousFocusNode != null) {
//               FocusScope.of(context).requestFocus(previousFocusNode);
//             }
//           }
//         },
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////اصلی پایینی هست
// class OTPWidget extends StatefulWidget {
//   const OTPWidget({
//     super.key,
//     this.topPadding,
//     required this.controllers,
//   });

//   final double? topPadding;
//   final List<TextEditingController> controllers;

//   @override
//   State<OTPWidget> createState() => _OTPWidgetState();
// }

// class _OTPWidgetState extends State<OTPWidget> {
//   FocusNode focusNode1 = FocusNode();
//   FocusNode focusNode2 = FocusNode();
//   FocusNode focusNode3 = FocusNode();
//   FocusNode focusNode4 = FocusNode();
//   FocusNode focusNode5 = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: EdgeInsets.only(top: widget.topPadding ?? 0),
//       child: Container(
//         height: height / 20,
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color(0xFFE5E5E5), width: 2),
//           color: const Color(0xFFFFFFFF),
//           borderRadius: const BorderRadius.all(Radius.circular(360)),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: width / 40),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               oneNumberCode(width, widget.controllers[0], focusNode1, context, null),
//               oneNumberCode(width, widget.controllers[1], focusNode2, context, focusNode1),
//               oneNumberCode(width, widget.controllers[2], focusNode3, context, focusNode2),
//               oneNumberCode(width, widget.controllers[3], focusNode4, context, focusNode3),
//               oneNumberCode(width, widget.controllers[4], focusNode5, context, focusNode4),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget oneNumberCode(
//     double width,
//     TextEditingController controller,
//     FocusNode focusNode,
//     BuildContext context,
//     FocusNode? previousFocusNode,
//   ) {
//     return SizedBox(
//       width: width / 20,
//       child: TextField(
//         focusNode: focusNode,
//         keyboardType: TextInputType.number,
//         controller: controller,
//         maxLength: 1,
//         textAlign: TextAlign.center,
//         decoration: const InputDecoration(
//           counterText: ' ',
//           border: InputBorder.none,
//           hintText: '_',
//           hintStyle: TextStyle(
//             color: Color(0xFF000000),
//             fontSize: 18,
//           ),
//         ),
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           } else if (value.isEmpty) {
//             if (previousFocusNode != null) {
//               FocusScope.of(context).requestFocus(previousFocusNode);
//             }
//           }
//         },
//       ),
//     );
//   }
// }

class OTPWidget extends StatelessWidget {
  const OTPWidget({
    super.key,
    this.topPadding,
    required this.controllers,
  });

  final double? topPadding;
  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: Container(
        height: 47,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildOtpField(controllers[0], context),
            buildOtpField(controllers[1], context),
            buildOtpField(controllers[2], context),
            buildOtpField(controllers[3], context),
            buildOtpField(controllers[4], context),
          ],
        ),
      ),
    );
  }

  Widget buildOtpField(TextEditingController controller, BuildContext context) {
    return Container(
      width: 60,
      height: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.onBoardColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12), // Padding for centering text
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Move to next field
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus(); // Move to previous field
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
