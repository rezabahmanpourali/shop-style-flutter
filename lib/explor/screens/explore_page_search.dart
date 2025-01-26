import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/widgets/category_item.dart';
import 'package:shop_style/common/widgets/state_manage_widget.dart';
import 'package:shop_style/explor/widgets/custom_end_page_container.dart';
import 'package:shop_style/explor/widgets/custom_textfield_explore.dart';
import 'package:shop_style/explor/widgets/date_picker_view.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/statemanagment/home_controller.dart';
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
      minuteLabelText: 'دقیقه',
      helpText: 'از چه زمانی',
      cancelText: 'بستن',
      confirmText: 'تایید',
      errorInvalidText: 'لطفا یک عدد وارد کنید',
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          ),
        );
      },
    );

    if (startTime != null) {
      startTime = TimeOfDay(hour: startTime.hour, minute: 0);

      // انتخاب زمان پایان
      TimeOfDay? endTime = await showTimePicker(
        hourLabelText: 'ساعت',
        minuteLabelText: 'دقیقه',
        helpText: 'تا چه زمانی',
        cancelText: 'بستن',
        confirmText: 'تایید',
        errorInvalidText: 'لطفا یک عدد وارد کنید',
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark(),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            ),
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
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 22, bottom: 20),
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
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(
                          8.0), // اضافه کردن فاصله بین آیتم‌ها
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // تعداد ستون‌ها
                        crossAxisSpacing: 1.1, // فاصله افقی بین آیتم‌ها
                        mainAxisSpacing: 2, // فاصله عمودی بین آیتم‌ها
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height /
                                5), // نسبت ابعاد هر آیتم
                      ),
                      itemCount:
                          context.watch<HomeController>().categories.length,
                      itemBuilder: (context, index) {
                        return Selector<HomeController, BlocStatus>(
                          selector: (context, controller) =>
                              controller.categoryStatus,
                          builder: (context, categoryStatus, child) {
                            final controller =
                                Provider.of<HomeController>(context);

                            return StateManageWidget(
                              status: categoryStatus,
                              loadingWidget: () {
                                return SizedBox(
                                  height: 60,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: CategoryShimer(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width),
                                      );
                                    },
                                  ),
                                );
                              },
                              errorWidgetBuilder: (message, statusCode) {
                                return Center(
                                  child: Text(controller.errorMessage),
                                );
                              },
                              completedWidgetBuilder: (value) {
                                final categories = controller.categories[index];

                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: CategoryItem(
                                    categoryModel: categories,
                                    onChange: () {
                                      print('category');
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: height * 0.01,
                right: 7,
                left: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
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
                    const Spacer(),
                    CustomEndPageContainer(
                      color: Colors.transparent,
                      border: Border.all(width: 1, color: AppColors.cardWhite),
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
    );
  }
}
