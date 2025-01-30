import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/edit_user_info/widgets/custom_textfield_user_info.dart'; // فایل لوکالیزیشن

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    // درخواست مجوزهای لازم
    if (source == ImageSource.camera) {
      await _requestPermission(Permission.camera);
    } else if (source == ImageSource.gallery) {
      await _requestPermission(Permission.photos);
    }

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // درخواست دسترسی برای دوربین یا گالری
  Future<void> _requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لطفاً به اپلیکیشن اجازه دسترسی بدهید'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Consumer<GlobalController>(
          builder: (context, globalController, child) {
            return Directionality(
              textDirection: globalController.language == 'fa' ||
                      globalController.language == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  const SliverAppBar(),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(right: 22, left: 22, bottom: 16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        AppLocalizations.of(context)!.accountInfo,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(right: 22, bottom: 16, left: 22),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        AppLocalizations.of(context)!.profile_picture,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 22,
                            right: 22,
                            bottom: 16,
                          ),
                          width: width * 0.2,
                          height: height * 0.1,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Mystery-Person-default-wordpress-avatar.webp'),
                            ),
                          ),
                          child: Stack(
                            children: [
                              // اگر عکسی انتخاب شده باشد، آن را نمایش می‌دهیم
                              if (_image != null)
                                Positioned.fill(
                                  child: ClipOval(
                                    child: Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: GestureDetector(
                                  onTap: () => _showBottomSheet(context),
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.pen,
                                        color: AppColors.arrowIcon,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _image = null; // عکس را حذف می‌کنیم
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.close,
                                        size: 18,
                                        color: AppColors.arrowIcon,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                        lablelText: AppLocalizations.of(context)!.full_name,
                        hintText: AppLocalizations.of(context)!.username,
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
                        lablelText: AppLocalizations.of(context)!.password,
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
                        lablelText: AppLocalizations.of(context)!.email,
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
                        lablelText: AppLocalizations.of(context)!.phone_number,
                        hintText: '09120000000',
                        onChange: (p0) {},
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.2,
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(bottom: 32, left: 22, right: 22),
                    sliver: SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            color: AppColors.tankBlueButton,
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.save_info,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
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
            );
          },
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.white2,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // عنوان
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                AppLocalizations.of(context)!.uploadPhoto,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.arrowIconBig,
                      fontSize: 13,
                    ),
              ),
            ),
            const Divider(
              color: AppColors.dividerColor900,
              height: 1,
            ),

            GestureDetector(
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.uploadFromGallery,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.tankBlue1,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: AppColors.dividerColor900,
              height: 1,
            ),

            GestureDetector(
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.uploadFromCamera,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.tankBlue1,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
