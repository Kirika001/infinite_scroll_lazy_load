import 'package:dio/dio.dart';
import 'package:infinite_scroll/const/app_constant.dart';

class NetworkCore{
  Dio dio = Dio();

  NetworkCore(){
    dio.options = BaseOptions(
        baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      headers: {
          "Accept" : "application/json"
      }
    );

  }
}