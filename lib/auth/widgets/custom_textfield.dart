import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller; // کنترلر برای مدیریت ورودی
  final String hintText; // متنی که در داخل فیلد نمایش داده می‌شود
  final TextInputType keyboardType; // نوع کیبورد (عدد، متن و ...)
  final String? Function(String?)? validator; // تابع اعتبارسنجی
  final bool obscureText; // برای مخفی کردن متن (برای رمز عبور)
  final TextCapitalization
      textCapitalization; // برای مشخص کردن اینکه متن به صورت بزرگ یا کوچک شروع شود
  final IconData? leftIcon; // آیکون سمت چپ
  final IconData? rightIcon; // آیکون سمت راست
  final Function()? onRightIconPressed; // عملکرد هنگام فشردن آیکون سمت راست
  final Color? borderColor; // رنگ مرز فیلد
  final TextStyle? textStyle; // استایل متن (مثل رنگ، فونت و ...)
  final Color? backgroundColor; // رنگ پس‌زمینه فیلد
  final bool showPasswordIcon; // برای نمایش آیکون مخفی کردن متن

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.leftIcon,
    this.rightIcon,
    this.onRightIconPressed,
    this.borderColor,
    this.textStyle,
    this.backgroundColor, // دریافت رنگ پس‌زمینه
    this.showPasswordIcon =
        false, // اگر خواستید نمایش آیکون مخفی کردن رمز فعال باشد
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText; // وضعیت مخفی کردن یا نمایش متن

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText; // تنظیم وضعیت اولیه مخفی کردن متن
  }

  // تغییر وضعیت مخفی کردن/نمایش متن
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:
          widget.controller, // استفاده از کنترلر برای دریافت و مدیریت مقدار
      keyboardType: widget.keyboardType, // نوع کیبورد
      obscureText: _obscureText, // مخفی کردن متن (برای رمز عبور)
      textCapitalization: widget.textCapitalization, // تنظیم حالت تبدیل حروف
      style: widget.textStyle, // استایل متن
      decoration: InputDecoration(
        hintText: widget.hintText, // متن راهنما (Placeholder)
        hintTextDirection: TextDirection.rtl, // راست‌چین کردن hintText
        hintStyle:
            const TextStyle(color: AppColors.hintTextColor, fontSize: 12),
        prefixIcon: widget.showPasswordIcon
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.iconGrey,
                ), // آیکون مخفی/نمایش متن
                onPressed: _toggleObscureText, // تغییر وضعیت مخفی/نمایش
                hoverColor: Colors.transparent, // حذف اثر hover
              )
            : widget.leftIcon != null
                ? Icon(
                    widget.leftIcon,
                    color: AppColors.iconGrey,
                  ) // آیکون سمت چپ در صورت عدم استفاده از آیکون مخفی کردن
                : null,
        suffixIcon: widget.rightIcon != null
            ? IconButton(
                icon: Icon(
                  widget.rightIcon,
                  color: AppColors.iconGrey,
                ), // آیکون سمت راست
                onPressed: widget.onRightIconPressed ??
                    () {}, // عملکرد هنگام فشردن آیکون
                hoverColor: Colors.transparent, // حذف اثر hover
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ??
                Colors.grey, // اگر رنگ مرز داده نشد، رنگ پیش‌فرض خاکی
          ),
          borderRadius: BorderRadius.circular(
              58), // شما می‌توانید شعاع دایره را تنظیم کنید
        ),
        filled: true, // برای پر کردن پس‌زمینه
        fillColor: widget.backgroundColor ?? Colors.white, // رنگ پس‌زمینه
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey, // رنگ مرز هنگام فوکوس
          ),
          borderRadius: BorderRadius.circular(58), // شعاع دایره
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.borderColor ?? Colors.grey, // رنگ مرز هنگام غیرفعال بودن
          ),
          borderRadius: BorderRadius.circular(58), // شعاع دایره
        ),
      ),
      validator: widget.validator, // اعتبارسنجی ورودی
    );
  }
}
