// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_style/common/configs/colors.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:shop_style/common/statemanagment/global_controller.dart'; // فایل لوکالیزیشن

// class CustomDropdown extends StatefulWidget {
//   const CustomDropdown({
//     super.key,
//     required this.lableField,
//     this.topPadding,
//     required this.items,
//   });

//   final String lableField;
//   final double? topPadding;
//   final List<Map<String, dynamic>>
//       items; // تغییرات: لیست شامل رنگ دایره نیز هست

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   String? selectedValue;

//   @override
//   void initState() {
//     super.initState();
//     // مقدار اولیه انتخاب شده را به null تنظیم می‌کنیم
//     selectedValue = null;
//   }

//   // این متد برای نمایش پاپ‌آپ انتخاب از لیست آیتم‌ها است
//   void _showDropdownDialog(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;

//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Container(
//             width: width * 0.8,
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: widget.items.asMap().entries.map(
//                 (entry) {
//                   String firstText = entry.value['first'] ?? '';
//                   String secondText = entry.value['second'] ?? '';
//                   Color circleColor =
//                       entry.value['circleColor'] ?? Colors.transparent;
//                   bool isLastItem = entry.key == widget.items.length - 1;

//                   return Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedValue = firstText;
//                           });
//                           Navigator.of(context).pop();
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Consumer<GlobalController>(
//                             builder: (context, globallController, child) {
//                               return Row(
//                                 mainAxisAlignment:
//                                     globallController.language == 'fa' ||
//                                             globallController.language == 'ar'
//                                         ? MainAxisAlignment.end
//                                         : MainAxisAlignment.start,
//                                 children: [
//                                   if (globallController.language == 'fa' ||
//                                       globallController.language == 'ar') ...[
//                                     Text(
//                                       firstText,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .displayMedium
//                                           ?.copyWith(
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 14,
//                                             color: AppColors.black,
//                                           ),
//                                     ),
//                                     Text(
//                                       secondText,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .displayLarge
//                                           ?.copyWith(
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 14,
//                                           ),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     if (circleColor != Colors.transparent) ...[
//                                       Container(
//                                         width: 20,
//                                         height: 20,
//                                         decoration: BoxDecoration(
//                                           color: circleColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                     ],
//                                   ],
//                                   if (globallController.language == 'en' ||
//                                       globallController.language == 'tr') ...[
//                                     if (circleColor != Colors.transparent) ...[
//                                       Container(
//                                         width: 20,
//                                         height: 20,
//                                         decoration: BoxDecoration(
//                                           color: circleColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       ),
//                                     ],
//                                     const SizedBox(width: 8),
//                                     Text(
//                                       secondText,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .displayLarge
//                                           ?.copyWith(
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 14,
//                                           ),
//                                     ),
//                                     Text(
//                                       firstText,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .displayMedium
//                                           ?.copyWith(
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 14,
//                                           ),
//                                     ),
//                                   ],
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       if (!isLastItem)
//                         const Divider(
//                           color: AppColors.dividerColor900,
//                           height: 1,
//                         ),
//                     ],
//                   );
//                 },
//               ).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;

//     return SizedBox(
//       child: Padding(
//         padding: EdgeInsets.only(top: widget.topPadding ?? 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               widget.lableField,
//               style: Theme.of(context).textTheme.displayLarge?.copyWith(
//                     color: AppColors.black,
//                     fontSize: 12,
//                   ),
//             ),
//             SizedBox(height: height / 100),
//             GestureDetector(
//               onTap: () {
//                 _showDropdownDialog(context);
//               },
//               child: Container(
//                 height: height / 18,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.onBoardColor, width: 1),
//                   color: AppColors.white2,
//                   borderRadius: const BorderRadius.all(Radius.circular(30)),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: width / 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // نمایش مقدار انتخاب شده یا اگر هیچ انتخابی نشده باشد، هیچ چیزی نمایش داده نشود
//                       if (selectedValue != null)
//                         Text(
//                           selectedValue!,
//                           style:
//                               TextStyle(color: AppColors.black, fontSize: 16),
//                         ),
//                       const Icon(
//                         Icons.keyboard_arrow_down_outlined,
//                         color: AppColors.black,
//                         size: 20,
//                         weight: 2,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart'; // فایل لوکالیزیشن

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.lableField,
    this.topPadding,
    required this.items,
    required this.onChanged, // اضافه کردن callback
  });

  final String lableField;
  final double? topPadding;
  final List<Map<String, dynamic>> items;
  final Function(String) onChanged; // نوع تابع برای ارسال مقدار انتخابی

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null;
  }

  void _showDropdownDialog(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: width * 0.8,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.items.asMap().entries.map(
                (entry) {
                  String firstText = entry.value['first'] ?? '';
                  String secondText = entry.value['second'] ?? '';
                  Color circleColor = entry.value['circleColor'] ?? Colors.transparent;
                  bool isLastItem = entry.key == widget.items.length - 1;

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedValue = firstText;
                          });
                          widget.onChanged(firstText); 
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Consumer<GlobalController>(
                            builder: (context, globallController, child) {
                              return Row(
                                mainAxisAlignment: globallController.language == 'fa' || globallController.language == 'ar'
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  if (globallController.language == 'fa' || globallController.language == 'ar') ...[
                                    Text(
                                      firstText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColors.black,
                                          ),
                                    ),
                                    Text(
                                      secondText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                    ),
                                    const SizedBox(width: 8),
                                    if (circleColor != Colors.transparent) ...[
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: circleColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ],
                                  if (globallController.language == 'en' || globallController.language == 'tr') ...[
                                    if (circleColor != Colors.transparent) ...[
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: circleColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                    const SizedBox(width: 8),
                                    Text(
                                      secondText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                    ),
                                    Text(
                                      firstText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      if (!isLastItem)
                        const Divider(
                          color: AppColors.dividerColor900,
                          height: 1,
                        ),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: widget.topPadding ?? 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.lableField,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.black,
                    fontSize: 12,
                  ),
            ),
            SizedBox(height: height / 100),
            GestureDetector(
              onTap: () {
                _showDropdownDialog(context);
              },
              child: Container(
                height: height / 18,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.onBoardColor, width: 1),
                  color: AppColors.white2,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (selectedValue != null)
                        Text(
                          selectedValue!,
                          style: TextStyle(color: AppColors.black, fontSize: 16),
                        ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.black,
                        size: 20,
                        weight: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

