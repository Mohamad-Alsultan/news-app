import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required Map<String, dynamic> parameter,
  }) async {
    return await dio.get(method, queryParameters: parameter);
  }

  static Future<Response> getDataSearch({
    required Map<String, dynamic> parameter,
  }) async {
    return await dio.get(methodSearch, queryParameters: parameter);
  }
}

String baseUrl = "https://newsapi.org/";
String method = "v2/top-headlines";

//baseurl: https://newsapi.org/
//method: v2/top-headlines?
//quire: country=de&category=business&apiKey=dadd929f5d5540e9bf2044fdba8a871c
String methodSearch = "v2/everything";
// baseurl: https://newsapi.org/
// method: v2/everything?
//quire:  q=anime&apiKey=dadd929f5d5540e9bf2044fdba8a871c