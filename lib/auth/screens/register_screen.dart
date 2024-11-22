import 'package:flutter/material.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/image_address.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.bgrgWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: width * 1,
                  height: height * 0.9,
                  decoration: const BoxDecoration(
                    color: AppColors.bgBlack,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1000),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * 0.175,
                  ),
                  const Text(
                    'ثبت نام',
                    style: TextStyle(
                      fontSize: 48,
                      color: AppColors.bgrgWhite,
                    ),
                  ),
                  //all textfield
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46, right: 46),
                    child: CustomTextField(
                      borderColor: Colors.transparent,
                      controller: phoneController,
                      hintText: 'شماره موبایل خود را وارد کنید',
                      keyboardType: TextInputType.emailAddress,
                      rightIcon: Icons.call,
                    ),
                  ),
                  //password
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46, right: 46),
                    child: CustomTextField(
                      borderColor: Colors.transparent,
                      controller: passwordController,
                      hintText: 'رمز عبور',
                      keyboardType: TextInputType.text,
                      rightIcon: Icons.lock,
                      showPasswordIcon: true,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  //confirm password
                  const Padding(
                    padding: EdgeInsets.only(right: 58),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'رمز خود را فراموش کرده اید؟',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textBlac100,
                            color: AppColors.textBlac100,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 46, right: 46),
                    child: CustomTextField(
                      borderColor: Colors.transparent,
                      controller: confirmPasswordController,
                      hintText: 'تکرار رمز عبور',
                      keyboardType: TextInputType.text,
                      rightIcon: Icons.lock,
                      showPasswordIcon: true,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    width: width * 0.35,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: AppColors.colorTextField,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: const Center(
                      child: Text(
                        'ثبت نام',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.bgBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: ClipPath(
                  clipper: _QuarterCircleClipper(),
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.2,
                    color: AppColors.bgGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuarterCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.arcTo(
      Rect.fromCircle(center: Offset(0, size.height), radius: size.height),
      0,
      -3.14 / 2,
      false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
