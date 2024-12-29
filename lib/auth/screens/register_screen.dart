import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/login_screen.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';

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
    final AuthController controller = context.read<AuthController>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Selector<AuthController, BlocStatus>(
        builder: (context, value, child) {
          return Center(
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
                          fontFamily: 'IRANSansBold',
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
                          textStyle: const TextStyle(
                            fontFamily: 'IRANSansRegular',
                          ),
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
                          textStyle: const TextStyle(
                            fontFamily: 'IRANSansRegular',
                          ),
                          keyboardType: TextInputType.text,
                          rightIcon: Icons.lock,
                          showPasswordIcon: true,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      //confirm password

                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 46, right: 46),
                        child: CustomTextField(
                          borderColor: Colors.transparent,
                          controller: confirmPasswordController,
                          hintText: 'تکرار رمز عبور',
                          textStyle: const TextStyle(
                            fontFamily: 'IRANSansRegular',
                          ),
                          keyboardType: TextInputType.text,
                          rightIcon: Icons.lock,
                          showPasswordIcon: true,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          controller.registerUser(
                            userName: phoneController.text,
                            password: passwordController.text,
                          );
                        },
                        child: Container(
                          width: width * 0.35,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: AppColors.colorTextField,
                            borderRadius: BorderRadius.circular(48),
                          ),
                          child: StateManageWidget(
                            status: value,
                            initialWidget: () {
                              return const Center(
                                child: Text(
                                  'ثبت نام',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.bgBlack,
                                    fontFamily: 'IRANYekabXB',
                                  ),
                                ),
                              );
                            },
                            loadingWidget: () {
                              return const CircularProgressIndicator();
                            },
                            errorWidgetBuilder: (message, statusCode) {
                              return const Text('یوز با موفقیت ثبت نشد ');
                            },
                            completedWidgetBuilder: (value) {
                              return const Center(
                                child: Text(
                                  'یوزر با موفقیت ثبت شد ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.bgBlack,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                              },
                              child: const Text(
                                'وارد شوید',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.bgrgWhite,
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'IRANSansDB'),
                              ),
                            ),
                          ),
                          const Text(
                            'حساب کاربری دارید؟',
                            style: TextStyle(
                                color: AppColors.textBlac100,
                                fontSize: 10,
                                fontFamily: 'IRANSansDB'),
                          ),
                        ],
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
          );
        },
        selector: (context, value) => value.registerUserState,
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
