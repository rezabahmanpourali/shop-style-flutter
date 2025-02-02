import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:toastification/toastification.dart';

class ModernToast extends StatelessWidget {
  const ModernToast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Toast Success Items
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showToast(
                context,
                '',
                'آرایشگاه شما با موفقیت ثبت شد',
                ToastificationType.success,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Success', style: TextStyle(color: Colors.white)),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              showToast(
                context,
                '',
                'آرایشگاه شما با موفقیت ثبت شد',
                ToastificationType.error,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Error', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  void showToast(BuildContext context, String title, String description,
      ToastificationType type) {
    toastification.show(
      closeOnClick: false,
      closeButtonShowType: CloseButtonShowType.none,
      icon: type == ToastificationType.error
          ? const Icon(
              Icons.close,
              color: AppColors.toastRed,
              size: 40,
              weight: 25,
            )
          : const Icon(
              Icons.check,
              color: AppColors.toastLineGreen,
              size: 40,
              grade: 5,
            ),
      context: context,
      type: type,
      title: Text(
        title,
      ),
      description: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          description,
          style: type == ToastificationType.success
              ? Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.toastLineGreen,
                  )
              : Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.toastRed,
                  ),
        ),
      ),
      primaryColor: Colors.white,
      autoCloseDuration: const Duration(seconds: 3),
      progressBarTheme: ProgressIndicatorThemeData(
        color: type == ToastificationType.success
            ? AppColors.toastLineGreen
            : type == ToastificationType.info
                ? Colors.blue
                : type == ToastificationType.warning
                    ? Colors.orange
                    : Colors.red,
        linearTrackColor: Colors.transparent,
      ),
      showProgressBar: true,
      direction: TextDirection.rtl,
      backgroundColor: type == ToastificationType.success
          ? AppColors.toastGreen
          : type == ToastificationType.info
              ? Colors.blue
              : type == ToastificationType.warning
                  ? Colors.orange
                  : AppColors.toastBottonRed,
      foregroundColor: Colors.white,
    );
  }
}
