import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/register_screen.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                        'ورود',
                        style: TextStyle(
                          fontSize: 48,
                          color: AppColors.bgrgWhite,
                          fontFamily: 'IRANSansBold',
                          fontWeight: FontWeight.w100,
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
                          controller: _phoneController,
                          hintText: 'شماره موبایل خود را وارد کنید',
                          textStyle: const TextStyle(
                            fontFamily: 'IRANSansRegular',
                          ),
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
                          controller: _passwordController,
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
                                fontFamily: 'IRANSansRegular',
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          controller.loginUser(
                            userName: _phoneController.text,
                            password: _passwordController.text,
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
                                  'ورود',
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
                              return const Text('یوزر لاگین نشد');
                            },
                            completedWidgetBuilder: (value) {
                              return const Center(
                                child: Text(
                                  'یوزر با موفقیت لاگین شد',
                                  style: TextStyle(
                                    fontSize: 16,
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
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'ثبت نام کنید',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.bgrgWhite,
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'IRANSansDB',
                              ),
                            ),
                          ),
                          const Text(
                            'حساب کاربری ندارید؟',
                            style: TextStyle(
                              color: AppColors.textBlac100,
                              fontSize: 10,
                              fontFamily: 'IRANSansDB',
                            ),
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
        selector: (context, value) => value.loginUserState,
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
