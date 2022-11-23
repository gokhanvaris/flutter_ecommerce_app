import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/constants/config/app_config.dart';
import 'package:flutter_ecommerce_app/data/network/service/dio/dio_logger.dart';
import 'package:flutter_ecommerce_app/models/login/user_model.dart';

class HttpManager {
  static String? token;
  static String? cookie;
  static User? user;
  final bool? isAuth;
  final String? tag;
  final String? baseUrl;

  final _dio = Dio();

  HttpManager(
      {this.tag, this.baseUrl, this.isAuth}) {
    _dio.options.baseUrl =
        baseUrl ?? AppConfig.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler handler) {
          _dio.interceptors.requestLock.unlock();
          _dio.interceptors.responseLock.unlock();
          if (!isAuth!) {
            if (token != null) {
              options.headers["Authorization"] =
                  "Bearer $token";
              options.headers["cookie"] = cookie;
            }
          } else {}

          DioLogger.onSend(tag!, options);
          return handler.next(options);
        },
        onResponse: (Response response,
            ResponseInterceptorHandler handler) {
          DioLogger.onSuccess(tag!, response);
          return handler.next(response);
        },
        onError: (DioError error,
            ErrorInterceptorHandler handler) {
          if (error.response?.statusCode == 401) {
            _dio.interceptors.requestLock.lock();
            _dio.interceptors.responseLock.lock();

            // goto logout
          }
          DioLogger.onError(tag!, error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get client => _dio;
}
