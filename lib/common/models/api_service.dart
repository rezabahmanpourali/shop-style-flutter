import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shop_style/common/configs/constatns.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/services/functions.dart';
import 'package:shop_style/common/services/response_model.dart';

class ApiClientV3 {
  late Dio dio;
  final String? baseUrl;
  final Map<String, dynamic>? headers;
  final bool enableRetry;
  final AppHttpHeadersEnum headerType;

  final Duration? receiveTimeout;
  ApiClientV3({
    this.baseUrl,
    this.enableRetry = true,
    this.headers,
    this.receiveTimeout,
    this.headerType = AppHttpHeadersEnum.Base,
  }) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl ?? Constatns.baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: receiveTimeout ?? const Duration(milliseconds: 5000),
    ));
    // dio.interceptors.add(CustomInterceptors());
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     dio.options.headers = getHeader(headerType);
    //     return handler.next(options);
    //   },
    //   onResponse: (response, handler) {
    //     return handler.next(response);
    //   },
    //   onError: (DioException error, handler) {
    //     inspect(error);
    //     return handler.next(error);
    //   },
    // ));
    // if (enableRetry) {
    //   dio.interceptors.add(
    //     RetryInterceptor(
    //       dio: dio,
    //       ignoreRetryEvaluatorExceptions: true,
    //       logPrint: print,
    //       retries: 3,
    //       retryDelays: const [
    //         Duration(seconds: 3),
    //         Duration(seconds: 6),
    //         Duration(seconds: 9),
    //       ],
    //     ),
    //   );
    // }
    // dio.interceptors.add(PrettyDioLogger(
    //   requestHeader: true,
    //   requestBody: true,
    //   responseBody: true,
    //   responseHeader: true,
    //   compact: false,
    //   request: false,
    // ));
  }

  Future<ResponseModel> get(String endpoint,
      {Map<String, dynamic>? queryParameters,
      ProgressCallback? onReceiveProgress,
      bool isOfflineApi = true,
      bool isLazyApi = false}) async {
    dio.options.headers = headers != null ? headers! : getHeader(headerType);
    dio.options.extra = {"isOfflineApi": isOfflineApi, "isLazyApi": isLazyApi};
    queryParameters = removeNullValueOFMap(queryParameters ?? {});
    try {
      Response response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return onResponse(response);
    } catch (error) {
      return onError(error as DioException);
    }
  }

  Future<ResponseModel> post(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio.options.headers = headers != null ? headers! : getHeader(headerType);
    queryParameters = removeNullValueOFMap(queryParameters ?? {});

    try {
      final Response response = await dio.post(
        endpoint,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return onResponse(response);
    } catch (error) {
      return onError(error as DioException);
    }
  }

  Future<ResponseModel> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    dio.options.headers = headers != null ? headers! : getHeader(headerType);
    queryParameters = removeNullValueOFMap(queryParameters ?? {});

    try {
      final Response response = await dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return onResponse(response);
    } catch (error) {
      return onError(error as DioException);
    }
  }

  Future<ResponseModel> delete(
    String endpoint, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = headers != null ? headers! : getHeader(headerType);

    try {
      final response = await dio.delete(endpoint,
          data: data, queryParameters: queryParameters);
      return onResponse(response);
    } catch (error) {
      return onError(error as DioException);
    }
  }

  Future<Response<dynamic>> download(
    String endpoint,
    dynamic savePath, {
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) async {
    final response = await dio.download(
      endpoint,
      savePath,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      data: data,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }

  ResponseModel onResponse(
    Response response,
  ) {
    return ResponseModel.sucsess(
      statusCode: response.statusCode,
      json: response.data,
    );
  }

  ResponseModel onError(DioException error) {
    // inspect(error);
    // applicationStrategyModel?.onFaild(
    //   responseModel: ResponseModel.faild(
    //     dioException: error,
    //   ),
    //   error: error,
    // );

    return ResponseModel.faild(
      dioException: error,
    );
  }
}

// getToken() {
//   return "Bearer ${locator<GlobalsCubit>().state.token}";
// }

// getDeviceId() {
//   return locator<GlobalsCubit>().state.xDeviceId;
// }

// getLanguage() {
//   return locator<GlobalsCubit>().state.language.name;
// }

Map<String, dynamic> getHeader(AppHttpHeadersEnum headerType) {
  switch (headerType) {
    case AppHttpHeadersEnum.Base:
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // 'Authorization': getToken(),
        // 'Accept-Language': getLanguage(),
        // 'x-device-id': getDeviceId(),
        // 'X-CLIENT-ID': 'teacher_flutter',
        // 'X-UNIVERSITY-ID':
        //     locator<GlobalsCubit>().state.currentRole?.university?.id,
        // "X-TEACHER-ID": locator<GlobalsCubit>().state.teacherId,
      };

    case AppHttpHeadersEnum.File:
      return {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        // 'Authorization': getToken(),
        // 'Accept-Language': getLanguage(),
        // 'x-device-id': getDeviceId(),
        // 'X-CLIENT-ID': 'teacher_flutter',
        // 'X-UNIVERSITY-ID':
        //     locator<GlobalsCubit>().state.currentRole?.university?.id,
      };

    case AppHttpHeadersEnum.Otp:
      return {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        // "Authorization": "Bearer ${locator<GlobalsCubit>().state.otpToken}",
        // "Accept-Language": getLanguage(),
        // "x-device-id": getDeviceId(),
        // "X-CLIENT-ID": "teacher_flutter",
      };

    default:
  }
  return {};
}
