import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_app/core/api/api_uri.dart';

enum RequestType { get, post, delete, put }

class BaseService {
  final Dio _dio = Dio();
  Options? _options;
  Future<T> requestAsync<T>(
      BuildContext buildContext, String path, RequestType type,
      {dynamic data}) async {
    late Response<dynamic> response;
    final uri = Uri(scheme: ApiUri.scheme, host: ApiUri.baseUrl, path: path);
    final url = Uri.decodeFull(uri.toString());
    try {
      switch (type) {
        case RequestType.post:
          response = await _dio.post(url, data: data, options: _options);
          break;
        case RequestType.get:
          response = await _dio.get(url,
              options: _options, queryParameters: data ?? {});
          break;
        case RequestType.delete:
          response = await _dio.delete(url, data: data, options: _options);
          break;
        case RequestType.put:
          response = await _dio.put(url, data: data, options: _options);
          break;
      }
    } on DioError catch (e) {
      if(e.response!.data != null) {
        response = e.response!.data;
      }
      // if (e.response!.data is Map<String, dynamic>) {
      //   var singleResponse = SingleResponse.fromJson(e.response!.data);
      //   var translate = Translate.fromJson(singleResponse.payload);
      //   // Toast.show(buildContext,
      //   //     '${buildContext.l10n?.get(context, translate, '${singleResponse.message}')}',
      //   //     duration: const Duration(seconds: 5));
      //   return singleResponse as T;
      // } else {
      //   // Toast.show(buildContext, '${buildContext.l10n?.couldNotConnect}',
      //   //     duration: const Duration(seconds: 5));
      //   // return SingleResponse.fromJson(e.response!.data) as T;
      // }
    }
    return fromJson<T>(response.data);
  }

  T fromJson<T>(Map<String, dynamic> json) {
    return json as T;
    // if (T == CollectionResponse) {
    //   return CollectionResponse.fromJson(json) as T;
    // } else {
    //   return SingleResponse.fromJson(json) as T;
    // }
  }
}