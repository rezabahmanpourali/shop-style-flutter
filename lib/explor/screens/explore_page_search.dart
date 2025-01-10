import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_style/common/widgets/category_item.dart';
import 'package:shop_style/explor/widgets/custom_end_page_container.dart';
import 'package:shop_style/explor/widgets/custom_textfield_explore.dart';
import 'package:shop_style/explor/widgets/date_picker_view.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/widgets/show_model_location.dart';

class ExplorePageSearch extends StatefulWidget {
  const ExplorePageSearch({super.key});

  @override
  State<ExplorePageSearch> createState() => _ExplorePageSearchState();
}

class _ExplorePageSearchState extends State<ExplorePageSearch> {
  TextEditingController _searchController = TextEditingController();
  String? selectedTimeRange = "انتخاب زمان";
  String? selectedDate;
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? startTime = await showTimePicker(
      hourLabelText: 'ساعت',
      barrierDismissible: true,
      minuteLabelText: 'دقیقه',
      helpText: 'انتخاب زمان',
      cancelText: 'بستن',
      confirmText: 'تایید',
      errorInvalidText: 'لطفا یک عدد وارد کنید',
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );

    if (startTime != null) {
      startTime = TimeOfDay(hour: startTime.hour, minute: 0);

      // انتخاب زمان پایان
      TimeOfDay? endTime = await showTimePicker(
        hourLabelText: 'ساعت',
        minuteLabelText: 'دقیقه',
        helpText: 'انتخاب زمان',
        cancelText: 'بستن',
        confirmText: 'تایید',
        errorInvalidText: 'لطفا یک عدد وارد کنید',
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      );

      if (endTime != null) {
        endTime = TimeOfDay(hour: endTime.hour, minute: 0);

        setState(() {
          selectedTimeRange =
              '${startTime?.format(context)} - ${endTime?.format(context)}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white2,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 22, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                //جستجوی خدمات
                CustomTextFieldExplore(
                  margin: const EdgeInsets.only(right: 22, left: 22),
                  width: double.infinity,
                  height: 59,
                  // ignore: deprecated_member_use
                  icon: const FaIcon(FontAwesomeIcons.search),
                  onChange: (p0) {},
                  title: 'جستجوی خدمات ',
                  isTextField: true,
                  controller: _searchController,
                ),
                const SizedBox(height: 12),
                //موقعیت مکانی
                CustomTextFieldExplore(
                  margin: const EdgeInsets.only(right: 22, left: 22),
                  width: double.infinity,
                  height: 59,
                  icon: const FaIcon(FontAwesomeIcons.locationDot),
                  onChange: (p0) {},
                  title: 'موقعیت مکانی ',
                  onTab: () {
                    showModalBottomSheet(
                      isScrollControlled: true, // برای کنترل ارتفاع باتم شیت
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return ShowModelLocation(
                          onSelectOption: (p0) {},
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //هنتخاب تاریخ
                      CustomTextFieldExplore(
                        width: 173,
                        height: 59,
                        icon: const FaIcon(FontAwesomeIcons.locationDot),
                        onChange: (p0) {},
                        title: 'انتخاب زمان ',
                        leftIcon:
                            const Icon(Icons.keyboard_arrow_down_outlined),
                        onTab: () {
                          _selectTime(context);
                        },
                      ),
                      //انتخاب زمان
                      CustomTextFieldExplore(
                          width: 173,
                          height: 59,
                          icon: const FaIcon(FontAwesomeIcons.locationDot),
                          onChange: (p0) {},
                          title: 'انتخاب تاریخ ',
                          leftIcon:
                              const Icon(Icons.keyboard_arrow_down_outlined),
                          onTab: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      DatePickerWidgetBase(
                                        now: Jalali.now(),
                                        onChange: (newDateTime, shouldClose) {
                                          if (shouldClose) {
                                            setState(() {
                                              selectedDate =
                                                  '${newDateTime.year}/${newDateTime.month}/${newDateTime.day}';
                                            });
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'بستن',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('اعمال',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 22, top: 32, bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        'دسته بندی',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 170,
                //   child: GridView.builder(
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: 3,
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2, // تعداد ستون‌ها
                //       crossAxisSpacing: 1, // فاصله بین ستون‌ها
                //       mainAxisSpacing: 1, // فاصله بین ردیف‌ها
                //       childAspectRatio: 2.2, // تنظیم نسبت ابعاد سلول
                //     ),
                //     itemBuilder: (context, index) {
                //       return CategoryItem(
                //         onChange: () {},
                //       );
                //     },
                //   ),
                // ),
                SizedBox(
                  height: height * 0.22,
                ),
                const Divider(
                  color: AppColors.dividerColor900,
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 7, top: 7, bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomEndPageContainer(
                        color: AppColors.black,
                        heigh: 60,
                        onChange: (p0) {},
                        title: 'جستجو',
                        width: 179,
                        textStyle: const TextStyle(
                          color: AppColors.white2,
                          fontSize: 16,
                        ),
                      ),
                      CustomEndPageContainer(
                        color: Colors.transparent,
                        border:
                            Border.all(width: 1, color: AppColors.cardWhite),
                        heigh: 60,
                        onChange: (p0) {},
                        title: 'پاک کردن',
                        width: 179,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
