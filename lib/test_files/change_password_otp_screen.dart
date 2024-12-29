import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:teacher_app/auth/presentation/widgets/login_banner_widget.dart';
import 'package:teacher_app/auth/presentation/widgets/login_box_widget.dart';
import 'package:teacher_app/common/bloc/global/global_cubit.dart';
import 'package:teacher_app/common/config/ant_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:teacher_app/common/widgets/app_bar_widget/custom_app_bar_return_btn.dart';
import 'package:teacher_app/common/widgets/connection_status_widget.dart';
import 'package:teacher_app/locator.dart';
import '../../../common/config/ant_colors.dart';
import '../../../common/config/my_theme.dart';
import '../../../common/core/resources/bloc_status.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/loading_widget.dart';
import '../../../common/widgets/small_circular_progress_indicator_widget.dart';
import '../cubit/authenticate_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teacher_app/common/helper/pop_helper/android_pop.dart'
    if (dart.library.html) 'package:teacher_app/common/helper/pop_helper/web_pop.dart';

class ChangePasswordOtpScreen extends StatefulWidget {
  static const name = "otp";

  const ChangePasswordOtpScreen({super.key});

  @override
  State<ChangePasswordOtpScreen> createState() =>
      ChangePasswordOtpScreenState();
}

class ChangePasswordOtpScreenState extends State<ChangePasswordOtpScreen>
    with CodeAutoFill {
  String signature = "{{ app signature }}";
  getAppSignature() async {
    signature = await SmsAutoFill().getAppSignature;
    setState(() {});
    // debugPrint(" signature $signature");
  }

  final pinController = TextEditingController();
  // final FocusNode focusNode = FocusNode();

  late AppLocalizations appLocalizations = AppLocalizations.of(context)!;

  late Timer timer;
  String? timerString;

  bool isEnableBtn = false;
  bool showError = false;
  bool buttonIsClicked = false;

  late String? mobileNumber = "";
  String lottieAddress = 'assets/images/02.json';

  @override
  void initState() {
    super.initState();
    // focusNode.requestFocus();
    getAppSignature();
    listenForCode();
    startCountdown();
    Future.delayed(Duration(milliseconds: 2000), () {
      if (lottieAddress != 'assets/images/03.json') {
        lottieAddress = 'assets/images/03.json';
        setState(() {});
      }
    });
  }

  void startCountdown() {
    int timeOtp = locator<GlobalsCubit>().state.otpModelState!.ttl!;
    // timeOtp=3;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeOtp > 0) {
          var minutes = timeOtp ~/ 60;
          var seconds = timeOtp % 60;
          timerString =
              '${minutes == 0 ? 0 : ''}${minutes == 0 ? 0 : minutes}:${seconds < 60 ? seconds < 10 ? 0 : '' : ''}$seconds';
          timeOtp -= 1;
        } else {
          timerString = "";
          timer.cancel();
        }
        // var ttt= '${timeOtp < 60 ? 0 : ''}${timeOtp < 60 ? 0 : 1}:${timeOtp < 60 ? timeOtp < 10 ? 0 : '' : timeOtp - 60 < 10 ? 0 : ''}${timeOtp < 60 ? timeOtp : timeOtp - 60}';
      });
    });
  }

  @override
  void dispose() {
    // focusNode.dispose();
    timer.cancel();
    unregisterListener();
    cancel();
    super.dispose();
  }

  @override
  void codeUpdated() {
    setState(() {
      pinController.text = code!;
      // debugPrint(" signature $code");

      _loginOtp();
    });
  }

  _loginOtp() async {
    // if (_formKey.currentState!.saveAndValidate()) {
    buttonIsClicked = true;
    await BlocProvider.of<AuthenticateCubit>(context).loginOtp(
      signature: signature,
      username: mobileNumber!,
      otp: pinController.text,
    );
    // if(context.mounted && !showError) {
    //   context.pushNamedNamed(ChangePasswordScreen.name);
    //   // context.pushNamedNamed(ChangePasswordScreen.name);
    //   // context.go("/${ChangePasswordOtpScreen.name}");
    // }
    // }
  }

  @override
  Widget build(BuildContext context) {
    mobileNumber = locator<GlobalsCubit>().state.mobileNumber;
    const focusedBorderColor = AntColors.colorPrimary;
    showError = false;

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: AntTextStyle.lightXLNormalDefault,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AntColors.colorBorder,
          width: 1,
        ),
      ),
    );

    Widget timerWidget() {
      if (timerString == null) {
        return const Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            width: 38,
            height: 38,
            child: SmallCircularProgressIndicatorWidget(
              color: AntColors.colorPrimary,
            ),
          ),
        );
      } else if (timerString != "") {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            height: 38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${appLocalizations.resend_at} $timerString',
                style: AntTextStyle.lightBaseNormalLink,
              ),
            ),
          ),
        );
      } else {
        return BlocBuilder<AuthenticateCubit, AuthenticateState>(
            buildWhen: (previous, current) =>
                previous.otpState != current.otpState,
            builder: (context, state) {
              if (state.otpState is BlocStatusLoading) {
                return const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    width: 38,
                    height: 38,
                    child: SmallCircularProgressIndicatorWidget(
                      color: AntColors.colorPrimary,
                    ),
                  ),
                );
              }
              if (state.otpState is BlocStatusError) {
                // return Text(tex)
              }
              return Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton(
                  // focusNode: FocusNode(canRequestFocus: false),
                  onPressed: () async {
                    await BlocProvider.of<AuthenticateCubit>(context).getOtp(
                      signature: signature,
                      mobileNumber: mobileNumber!,
                    );
                    startCountdown();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.only(end: 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.arrowRotateRight,
                            size: 12,
                            color: AntColors.colorPrimary,
                          ),
                        ),
                        Text(
                          appLocalizations.resend, //ارسال مجدد
                          style: AntTextStyle.lightBaseNormalLink,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }
    }

    Widget pinWidget() {
      return Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              controller: pinController,
              // focusNode: focusNode,
              // androidSmsAutofillMethod:
              // AndroidSmsAutofillMethod.smsUserConsentApi,
              // listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 12),
              validator: (value) {
                return null;

                // // return value == '222222'
                // return value?.length == 6
                //     ? null
                //     : appLocalizations.wrong_entered_code;//'.کد وارد شده اشتباه است';
              },
              errorBuilder: (value, a) {
                return Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      value.toString(),
                      style: const TextStyle(fontSize: 17.5, color: Colors.red),
                    ),
                  ),
                );
              },
              onClipboardFound: (value) {
                //debugPrint('onClipboardFound: $value');
                pinController.setText(value);
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                if (pin.length == 6) {
                  setState(() {
                    isEnableBtn = true;
                  });
                }
              },
              onChanged: (value) {
                if (value.length != 6) {
                  setState(() {
                    isEnableBtn = false;
                  });
                }
                showError = false;
                buttonIsClicked = false;
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 12,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  // borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: focusedBorderColor,
                    width: 1,
                  ),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: focusedBorderColor,
                    width: 1,
                  ),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          timerWidget(),
          const SizedBox(
            height: 24.0,
          ),
        ],
      );
    }

    Widget confirmButton() {
      return CustomElevatedButton(
        onPressedButton: _loginOtp,
        isEnable: isEnableBtn,
        text: appLocalizations.confirm, //تایید
        textColor: Colors.white,
        backgroundColor: MyThemes.lightTheme.primaryColor,
      );
    }

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        BlocProvider.of<AuthenticateCubit>(context).updateLastRout();
      },
      child: LoginBoxWidget(
        child: Column(
          children: [
            headerOtp(context),
            const SizedBox(height: 40),
            Hero(
              tag: 'lottie-animation',
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Lottie.asset(
                  lottieAddress,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),
            foterOtp(pinWidget, confirmButton),
          ],
        ),
      ),
    );
  }

  Column foterOtp(
      Widget Function() pinWidget, Widget Function() confirmButton) {
    return Column(
      children: [
        pinWidget(),
        BlocBuilder<AuthenticateCubit, AuthenticateState>(
          buildWhen: (previous, current) {
            return previous.loginOtp != current.loginOtp;
          },
          builder: (context, state) {
            if (state.loginOtp is BlocStatusLoading) {
              return const Center(child: LoadingWidget());
            }
            if (state.loginOtp is BlocStatusError) {
              showError = true;
              return Column(
                children: [
                  if (showError &&
                      buttonIsClicked &&
                      (state.loginOtp as BlocStatusError).message.toString() !=
                          "")
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (state.loginOtp as BlocStatusError).message.toString(),
                        style: AntTextStyle.lightHeadingHeading6Danger,
                      ),
                    ),
                  confirmButton(),
                ],
              );
            }
            return confirmButton();
          },
        ),
      ],
    );
  }

  SizedBox headerOtp(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBarReturnBtn(
                fgColor: AntColors.colorBlack,
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsetsDirectional.only(end: 16.0),
                child: ConnectionStatusWidgetIcon(),
              ),
            ],
          ),
          // SvgPicture.asset("assets/images/timez_logo.svg"),
        ],
      ),
    );
  }
}
