


import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl:"https://www.goldapi.io/api/" ,
        receiveDataWhenStatusError: true,
      ),
    );
  }




  static Future<Response> getData(String url){
    dio!.options.headers={
      'x-access-token':'goldapi-3ldw5rlj8obb4n-io'
    };

return dio!.get(url);
  }//end

}