// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shop_style/common/configs/colors.dart';

// class NewOtpScreen extends StatelessWidget {
//   const NewOtpScreen({
//     super.key,
//   });

  

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 47,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           buildOtpField(context),
//           buildOtpField(context),
//           buildOtpField(context),
//           buildOtpField(context),
//           buildOtpField(context),
//         ],
//       ),
//     );
//   }

//   Widget buildOtpField(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 47,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: AppColors.onBoardColor,
//             width: 1,
//           )),
//       child: TextFormField(
//         decoration: const InputDecoration(
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.all(12), // Padding for centering text
//         ),
//         onSaved: (pin) {},
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus(); // Move to next field
//           } else if (value.isEmpty) {
//             FocusScope.of(context).previousFocus(); // Move to previous field
//           }
//         },
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly,
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_style/common/configs/colors.dart';

class NewOtpScreen extends StatefulWidget {
  const NewOtpScreen({super.key});

  @override
  _NewOtpScreenState createState() => _NewOtpScreenState();
}

class _NewOtpScreenState extends State<NewOtpScreen> {
  // List of TextEditingControllers for each OTP field
  final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());

  // List of FocusNodes for managing focus between fields
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    // Dispose controllers and focus nodes to prevent memory leaks
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          return buildOtpField(context, index);
        }),
      ),
    );
  }

  Widget buildOtpField(BuildContext context, int index) {
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
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 4) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]); // Move to next field
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]); // Move to previous field
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

