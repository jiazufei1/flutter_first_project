import 'package:dio/dio.dart';

class HttpRequest {
  static Dio dio;

  BaseOptions options;

  HttpRequest([BaseOptions baseOptions]) {
    if (baseOptions == null) {
      baseOptions = BaseOptions(
          baseUrl: 'http://192.168.1.17:3000',
          connectTimeout: 5000,
          receiveTimeout: 3000);
    }
    this.options = baseOptions;
    dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) {
      return e;
    }));
  }

  //GET请求
  Future get(String path,
      {queryParameters, Options options, CancelToken cancelToken}) async {
    return await dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }
}

HttpRequest httpRequest = new HttpRequest();
