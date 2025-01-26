import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/screens/completion_information.dart';
import 'package:shop_style/auth/widgets/custom_button.dart';
import 'package:shop_style/auth/widgets/custom_textbox.dart';
import 'package:shop_style/auth/widgets/custom_textfield.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/common/widgets/text_padding.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  bool hasAcceptance = false;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 15),
        child: Consumer<GlobalController>(
          builder: (context, globalController, child) {
            return Directionality(
              textDirection: globalController.language == 'fa' ||
                      globalController.language == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.complete_account,
                      topPadding: height / 10,
                      theme: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextPadding(
                      text: AppLocalizations.of(context)!.almost_done,
                      topPadding: height / 100,
                      theme:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.purpleOpacity,
                              ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.full_namee,
                      type: TextfieldType.none,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.passwordd,
                      type: TextfieldType.security,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.repeat_password,
                      type: TextfieldType.security,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomTextfield(
                      topPadding: height / 50,
                      lableField: AppLocalizations.of(context)!.email_optional,
                      type: TextfieldType.none,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: acceptance(height, width, context),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      topPadding: height / 5.5,
                      textButton: AppLocalizations.of(context)!.sign_up,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CompletionInformation(),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                        );
                      },
                      child: TextPadding(
                        textAlign: TextAlign.center,
                        text: AppLocalizations.of(context)!.complete_later,
                        theme: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget acceptance(double height, double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height / 30),
      child: Row(
        children: [
          Container(
              width: width / 20,
              height: width / 20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: CustomCheckbox(
                value: hasAcceptance,
                onChanged: (value) {
                  setState(() {
                    hasAcceptance = value!;
                  });
                },
              )),
          SizedBox(width: width / 40),
          Row(
            children: [
              TextPadding(
                text: AppLocalizations.of(context)!.accept,
                theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bgBlack,
                    ),
              ),
              TextPadding(
                text: AppLocalizations.of(context)!.terms_conditions,
                theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.purpleOpacity,
                    ),
              ),
              TextPadding(
                text: AppLocalizations.of(context)!.use_of_service,
                theme: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bgBlack,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
