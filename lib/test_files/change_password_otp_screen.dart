// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lottie/lottie.dart';



// import 'package:pinput/pinput.dart';

// import 'package:sms_autofill/sms_autofill.dart';
// import 'package:teacher_app/auth/presentation/widgets/login_banner_widget.dart';
// import 'package:teacher_app/auth/presentation/widgets/login_box_widget.dart';
// import 'package:teacher_app/common/config/ant_text_style.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:teacher_app/common/widgets/app_bar_widget/custom_app_bar_return_btn.dart';
// import 'package:teacher_app/common/widgets/connection_status_widget.dart';
// import '../../../common/config/ant_colors.dart';
// import '../../../common/config/my_theme.dart';
// import '../../../common/widgets/custom_elevated_button.dart';
// import '../../../common/widgets/loading_widget.dart';
// import '../../../common/widgets/small_circular_progress_indicator_widget.dart';
// // ignore: depend_on_referenced_packages
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:teacher_app/common/helper/pop_helper/android_pop.dart'
//     if (dart.library.html) 'package:teacher_app/common/helper/pop_helper/web_pop.dart';

// class ChangePasswordOtpScreen extends StatefulWidget {
//   static const name = "otp";

//   const ChangePasswordOtpScreen({super.key});

//   @override
//   State<ChangePasswordOtpScreen> createState() =>
//       ChangePasswordOtpScreenState();
// }

// class ChangePasswordOtpScreenState extends State<ChangePasswordOtpScreen>
//     with CodeAutoFill {
//   String signature = "{{ app signature }}";
//   final pinController = TextEditingController();
//   late AppLocalizations appLocalizations;
//   late Timer timer;
//   String? timerString;
//   bool buttonIsClicked = false;
//   String? mobileNumber = "";
//   String lottieAddress = 'assets/images/02.json';

//   @override
//   void initState() {
//     super.initState();
//     getAppSignature();
//     listenForCode();
//     startCountdown();
//     Future.delayed(Duration(milliseconds: 2000), () {
//       if (lottieAddress != 'assets/images/03.json') {
//         lottieAddress = 'assets/images/03.json';
//         setState(() {});
//       }
//     });
//   }

//   void getAppSignature() async {
//     signature = await SmsAutoFill().getAppSignature;
//     setState(() {});
//   }

//   void startCountdown() {
//     int timeOtp = 180; // مدت زمان OTP (به ثانیه)
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (timeOtp > 0) {
//           var minutes = timeOtp ~/ 60;
//           var seconds = timeOtp % 60;
//           timerString =
//               '${minutes == 0 ? 0 : ''}${minutes == 0 ? 0 : minutes}:${seconds < 10 ? '0' : ''}$seconds';
//           timeOtp -= 1;
//         } else {
//           timerString = "";
//           timer.cancel();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     unregisterListener();
//     cancel();
//     super.dispose();
//   }

//   @override
//   void codeUpdated() {
//     setState(() {
//       pinController.text = code!;
//       _loginOtp();
//     });
//   }

//   _loginOtp() async {
//     buttonIsClicked = true;
//     // منطق ورود OTP را اینجا پیاده‌سازی کنید
//     // به عنوان مثال:
//     // final result = await authenticateUser(signature, mobileNumber!, pinController.text);
//     // if (result.isSuccess) {
//     //   Navigator.pushNamed(context, ChangePasswordScreen.name);
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     appLocalizations = AppLocalizations.of(context)!;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(appLocalizations.changePassword),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             // اضافه کردن ویجت‌های دیگر مانند Pinput و دکمه‌ها
//             Pinput(
//               controller: pinController,
//               length: 6,
//               onCompleted: (pin) {              _loginOtp();
//               },
//             ),
//             // دکمه ارسال OTP
//             CustomElevatedButton(
//               onPressed: buttonIsClicked ? null : _loginOtp,
//               child: Text(appLocalizations.submit),
//             ),
//             // نمایش تایمر
//             timerString != null
//                 ? Text("Time remaining: $timerString")
//                 : SizedBox.shrink(),
//           ],
//         ),
//       ),
//     );
//   }
// }
