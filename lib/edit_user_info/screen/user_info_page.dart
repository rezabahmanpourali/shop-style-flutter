import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverPadding(
                padding: const EdgeInsets.only(right: 22, left: 22, bottom: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'اطلاعات حساب کاربری',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 16,
                ),
                sliver: SliverToBoxAdapter(
                  child: CustomTextFieldUserInfo(
                    keyboardType: TextInputType.text,
                    lablelText: 'نام و نام خانوادگی',
                    hintText: 'نام کاربر',
                    onChange: (p0) {},
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 16,
                ),
                sliver: SliverToBoxAdapter(
                  child: CustomTextFieldUserInfo(
                    keyboardType: TextInputType.text,
                    lablelText: 'رمز عبور',
                    hintText: '.............',
                    onChange: (p0) {},
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 16,
                ),
                sliver: SliverToBoxAdapter(
                  child: CustomTextFieldUserInfo(
                    keyboardType: TextInputType.emailAddress,
                    lablelText: 'ایمیل',
                    hintText: 'email@email.com',
                    onChange: (p0) {},
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                ),
                sliver: SliverToBoxAdapter(
                  child: CustomTextFieldUserInfo(
                    keyboardType: TextInputType.phone,
                    lablelText: 'شماره تلفن',
                    hintText: '09120000000',
                    onChange: (p0) {},
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 280,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 32, left: 22, right: 22),
                sliver: SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 47,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: AppColors.black,
                      ),
                      child: Center(
                        child: Text(
                          'ذخیره اطلاعات',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.white2,
                                  ),
                        ),
                      ),
                    ),
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

class CustomTextFieldUserInfo extends StatelessWidget {
  const CustomTextFieldUserInfo({
    super.key,
    required this.lablelText,
    required this.hintText,
    required this.onChange,
    required this.keyboardType,
  });
  final String lablelText;
  final String hintText;
  final Function(String) onChange;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: AppColors.cardWhite,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lablelText,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: keyboardType,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.pen,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
