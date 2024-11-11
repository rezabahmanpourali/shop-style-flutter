// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:shop_style/common/models/error_model.dart';

class ResponseModel<T> {
  final int? statusCode;
  final dynamic json;
  late T? data;
  ErrorModel? error;
  ResponseModel({
    required this.statusCode,
    this.json,
    this.data,
    this.error,
  });
  ResponseModel.sucsess({
    required this.statusCode,
    required this.json,
  });
  ResponseModel.faild({
    required DioException dioException,
  })  : statusCode = dioException.response?.statusCode,
        error = ErrorModel.fromJson(dioException),
        json = null;

  /* 
  ResponseModel({
    required this.statusCode,
    required this.json,
   
  }) {
    error = ErrorModel.fromJson(statusCode, json);
  } */

  bool get hasError => (statusCode ?? 400) >= 400;
  String get messageFactory {
    switch (statusCode) {
      case 100:
        return 'ادامه دهید.';
      case 101:
        return 'پروتکل‌ها تغییر کرده‌اند.';
      case 200:
        return 'درخواست با موفقیت انجام شد.';
      case 201:
        return 'منبع با موفقیت ایجاد شد.';
      case 202:
        return 'درخواست پذیرفته شده است.';
      case 203:
        return 'اطلاعات غیرقطعی.';
      case 204:
        return 'بدون محتوا.';
      case 205:
        return 'بازنشانی محتوا.';
      case 206:
        return 'محتوای جزئی.';
      case 300:
        return 'انتخاب‌های متعدد.';
      case 301:
        return 'انتقال دائمی.';
      case 302:
        return 'انتقال موقت.';
      case 303:
        return 'مشاهده سایر موارد.';
      case 304:
        return 'تغییر نیافته.';
      case 305:
        return 'از پراکسی استفاده کنید.';
      case 307:
        return 'تغییر مسیر موقت.';
      case 308:
        return 'تغییر مسیر دائمی.';
      case 400:
        return 'درخواست نامعتبر است.';
      case 401:
        return 'شما مجاز به دسترسی نیستید.';
      case 403:
        return 'دسترسی ممنوع است.';
      case 404:
        return 'منبع یافت نشد.';
      case 405:
        return 'متد مجاز نیست.';
      case 406:
        return 'قابل قبول نیست.';
      case 407:
        return 'نیاز به احراز هویت پراکسی.';
      case 408:
        return 'تایم‌اوت درخواست.';
      case 409:
        return 'تضاد.';
      case 410:
        return 'گم شده.';
      case 411:
        return 'طول لازم است.';
      case 412:
        return 'شرط پیش‌نیاز برآورده نشده.';
      case 413:
        return 'محتوای درخواست بیش از حد بزرگ است.';
      case 414:
        return 'URI بیش از حد طولانی است.';
      case 415:
        return 'نوع رسانه پشتیبانی نمی‌شود.';
      case 416:
        return 'محدوده درخواست شده قابل پذیرش نیست.';
      case 417:
        return 'انتظار رد شد.';
      case 426:
        return 'نیاز به ارتقاء.';
      case 500:
        return 'خطای داخلی سرور رخ داده است.';
      case 501:
        return 'پیاده‌سازی نشده.';
      case 502:
        return 'خطای دروازه.';
      case 503:
        return 'سرویس در دسترس نیست.';
      case 504:
        return 'تایم‌اوت';
      default:
        return "خطای ناشناخته.";
    }
  }

  @override
  String toString() {
    return 'ResponseModel(statusCode: $statusCode, json: $json, data: $data, error: $error)';
  }
}
