import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/app/constant.dart';
import 'package:ecommerce_app/app/enum.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class RestClientService extends GetxService {
  final Dio dio;

  RestClientService({required this.dio}) {
    initInterceptors();
  }

  void initInterceptors() {
    dio.options.baseUrl = Urls.BASE_URL;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          Map<String, dynamic> map = <String, dynamic>{};
          map['Accept'] = 'application/json';
          options.headers = map;
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (err, handler) => handler.next(err),
      ),
    );
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, dynamic>? params,
  }) async {
    Response response;
    try {
      if (method == Method.POST) {
        response = await dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await dio.patch(url, data: params);
      } else {
        response = await dio.get(url, queryParameters: params);
      }
      return response.data;
    } on FormatException catch (e) {
      throw const FormatException("Unable to process the data");
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioError catch (e) {
      rethrow;
    }
  }
}
