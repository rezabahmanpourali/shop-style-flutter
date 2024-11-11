import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorModel {
  String? message = "";
  Map<String, String>? errorsForm;

  ErrorModel.fromJson(DioException error) {
    if (error.response?.data is Map<String, dynamic>) {
      var data = error.response?.data as Map<String, dynamic>;

      if (data.containsKey('detail')) {
        switch (error.response?.statusCode) {
          case 422:
            errorsForm = parseJsonToMap422(data);
            break;
          case 405:
          case 409:
            message = data["msg"]?.toString() ??
                data["detail"]?.toString() ??
                'ارور نامشخص';

            break;
          default:
            message = (data["detail"] is List)
                ? (data["detail"].isNotEmpty
                    ? (data["detail"] as List).first["msg"]?.toString()
                    : 'ارور نامشخص')
                : data["detail"]?.toString() ?? 'ارور نامشخص';
        }
      } else {
        message = data["message"]?.toString() ?? 'ارور نامشخص';
      }
    } else {
      message = error.message ?? 'ارور نامشخص';
    }
  }

  @override
  String toString() => 'ErrorModel(message: $message, errors: $errorsForm)';

  Map<String, String> parseJsonToMap422(Map<String, dynamic> jsonResponse) {
    final List<dynamic> details = jsonResponse['detail'] ?? [];

    Map<String, String> resultMap = {};

    for (var detail in details) {
      final loc = detail['loc'] as List<dynamic>?;
      final msg = detail['msg'] as String?;

      if (loc != null && loc.isNotEmpty && msg != null) {
        String key = loc.last.toString();
        resultMap[key] = msg;
      }
    }

    return resultMap;
  }
}
