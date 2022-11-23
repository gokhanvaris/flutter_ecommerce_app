import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/data/network/service/http_exception.dart';
import 'package:flutter_ecommerce_app/data/network/service/http_manager.dart';

abstract class AbstractService<E> {
  final String? _path;
  final String? _tag;
  final String? baseUrl;
  final bool? isAuth;
  Dio? _client;

  AbstractService(
    this._path,
    this._tag, {
    this.baseUrl,
    this.isAuth = false,
  }) {
    _client = HttpManager(
      tag: _tag,
      baseUrl: baseUrl,
      isAuth: isAuth,
    ).client;
  }

  Future<Response> get({
    String? innerPath = "",
    CancelToken? cancelToken,
    Map<String, dynamic>? queryParameters =
        const {},
  }) async {
    try {
      final response = await _client?.get(
        "/$_path/$innerPath",
        queryParameters: queryParameters ?? {},
        cancelToken: cancelToken ?? CancelToken(),
      );
      throwIfNoSuccess(response);
      return response ??
          Response(
              requestOptions:
                  RequestOptions(path: ''));
    } catch (e) {
      rethrow;
    }
  }

  post(E entity, String innerPath) async {
    try {
      final response = await _client?.post<E>(
          "$_path/$innerPath",
          data: entity);
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  postCustom({
    String? innerPath = "",
    CancelToken? cancelToken,
    required data,
    Map<String, dynamic>? queryParameters =
        const {},
    Options? options,
  }) async {
    try {
      print(innerPath);
      print(data);
      final response = await _client?.post(
        "$_path/$innerPath",
        queryParameters: queryParameters ?? {},
        data: data,
        options: options ?? Options(),
        cancelToken: cancelToken ?? CancelToken(),
      );
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put({
    String? innerPath = "",
    CancelToken? cancelToken,
    Map<String, String>? queryParameters =
        const {},
  }) async {
    try {
      final response = await _client?.put(
        "/$_path/$innerPath",
        queryParameters: queryParameters ?? {},
        cancelToken: cancelToken ?? CancelToken(),
      );
      throwIfNoSuccess(response);
      return response ??
          Response(
              requestOptions:
                  RequestOptions(path: ''));
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({
    String? innerPath = "",
    CancelToken? cancelToken,
    Map<String, String>? queryParameters =
        const {},
  }) async {
    try {
      final response = await _client?.delete(
        "/$_path/$innerPath",
        queryParameters: queryParameters ?? {},
        cancelToken: cancelToken ?? CancelToken(),
      );
      throwIfNoSuccess(response);
      return response ??
          Response(
              requestOptions:
                  RequestOptions(path: ""));
    } catch (e) {
      rethrow;
    }
  }

  void throwIfNoSuccess(Response? response) {
    if ((response?.statusCode ?? 0) < 200 ||
        (response?.statusCode ?? 0) > 299) {
      throw HttpException(response ??
          Response(
              requestOptions:
                  RequestOptions(path: "")));
    }
  }

  postCustomString({
    String? innerPath = "",
    CancelToken? cancelToken,
    required data,
    Map<String, dynamic>? queryParameters =
        const {},
    Options? options,
  }) async {
    try {
      final Response<String>? response =
          await _client?.post(
        "$_path/$innerPath",
        queryParameters: queryParameters ?? {},
        data: data,
        options: options ?? Options(),
        cancelToken: cancelToken ?? CancelToken(),
      );
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  postString(E entity, String innerPath) async {
    try {
      final Response<String>? response =
          await _client?.post("$_path/$innerPath",
              data: entity);
      throwIfNoSuccess(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
