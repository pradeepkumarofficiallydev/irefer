// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart' as http;
//
// import '../AppExceptions.dart';
// import 'base_api_services.dart';
//
//  class   NetworkApiServices extends  BaseApiServices
// {
//
//
//   @override
//   Future getApi(String url) async {
//     dynamic responseJson;
//
//     var response= await http.get(Uri.parse("https://api.primelendinghub.in/api/allprofession")).timeout(const Duration( seconds: 30));
//
//     print("tttttststs"+response.body);
//
//
//
//     try
//     {
//
//       //print( "eehdehdeh:");
//
//
//       var response= await http.get(Uri.parse(url)).timeout(const Duration( seconds: 30));
//
//         print("tttttststs"+response.body);
//
//         responseJson=returnResponse(response);
//
//
//
//        }
//        on
//
//       SocketException{
//
//       print("qqqqq");
//
//
//       throw  InternetException("") ;
//
//       }
//       on TimeoutException
//       {
//
//        throw  RequestTimeOut("Connection time out");
//
//
//       }
//
//       return responseJson;
//
//
//       }
//
//
//
//
//
//
//
//
//
//   @override
//   Future postApi(Map<String, dynamic> map,url) async {
//     dynamic responseJson;
//     try
//     {
//
//       print("tttttststs${map.toString()}");
//
//       var response= await http.post(Uri.parse(url),
//
//           body: map
//
//
//
//       ).timeout(const Duration( seconds: 40));
//
//
//
//
//       print("tttttststs"+response.body);
//
//
//
//       responseJson=returnResponse(response);
//
//
//
//     }
//     on
//
//     SocketException{
//
//       print("qqqqq");
//
//
//       throw  InternetException("") ;
//
//     }
//     on TimeoutException
//     {
//
//       throw  RequestTimeOut("Connection time out");
//
//
//     }
//
//     return responseJson;
//
//
//   }
//
//
//   dynamic returnResponse(http.Response response)
//   {
//     switch(response.statusCode)
//
//     {
//
//           case 200:
//
//           dynamic responsejson=jsonDecode(response.body);
//           print(response.statusCode);
//
//
//         return responsejson;
//
//         case 400:
//         throw InvalidUrl;
//
//         default:
//
//           throw FetchDataException("Error accourd while communication with server");
//
//
//
//
//     }
//
//
//   }
//
//
//
//
//
//
// }













import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/Preference.dart';
import '../../utils/Strings.dart';
import '../AppExceptions.dart';
import 'base_api_services.dart';

import 'package:fluttertoast/fluttertoast.dart';

class NetworkApiServices extends BaseApiServices {

  static final NetworkApiServices _instance = NetworkApiServices._internal();

  // Private constructor to prevent instantiation
  NetworkApiServices._internal() {
    // Initialize the ApiClient (which sets up Dio with interceptors)
    ApiClient();
    _getSharedPreferences();
  }

  factory NetworkApiServices() {
    return _instance;
  }



  String accessToken="";


  final Dio dio = Dio(BaseOptions(
    baseUrl: Strings.baseUrl,


    // Can be modified for other URLs
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    // headers: {'Content-Type': 'application/json'},
  ));




  void _getSharedPreferences()
  {

    //accessToken = Preference.shared?.getString(Preference.USER_NAME)??"";

    accessToken="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvYmoiOnsicm9sZSI6MSwidXNlcmlkIjoxMTY0NzI3MCwiZmlyc3RfbmFtZSI6IlByYWRlZXAiLCJsYXN0X25hbWUiOiJLdW1hciIsInVzZXJuYW1lIjoicHJhZGVlcGt1bWFycmR4NzRAZ21haWwuY29tIiwicGhvbmVfbm8iOiI5NTIwNTgzOTMwIiwibGFuZ3VhZ2VfaWQiOjEsImxhbmdfY29kZSI6IkVOIiwiY3VsdHVyZV9pZCI6IjQiLCJ1c2VyX2xvY2F0aW9uIjoiVVMiLCJjb3VudHJ5X2lkIjoxMDIsImltYWdlX25hbWUiOiJodHRwczovL3d3dy5vcGluaW9uYnVyZWF1LmNvbS9Eb2N1bWVudC9QYW5lbGlzdF9waWNzX2VuY3J5cHRlZC91bmRlZmluZWQucG5nIiwiaXBfYWRkcmVzcyI6IjExNS4yNDYuMTIwLjIwNiIsIm1lbWJlcnNpbmNleWVhciI6MjAyNSwibWVtYmVyc2hpcF9zdGF0dXMiOiJTIiwiY3VycmVuY3lfc3ltYm9sIjoi4oK5IiwiZGVtb19zdXJ2ZXlfdGFrZW4iOiJOIiwidGltZVpvbmUiOiJBc2lhL0NhbGN1dHRhIiwiY291bnRyeV9jb2RlIjoiSU4ifSwiaWF0IjoxNzM4MzE4Mzk0fQ.8sMorksRBAr6PquS1T4tOm4oIb81noFsKr2S1u-pTGc";



  }




  ApiClient() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Sending request to: ${options.uri}');

        print('Sending request to: ${options.uri}');
        print('Request Headers: ${options.headers}');
        print('Request Body: ${options.data}');



        return handler.next(options);
      },
      onResponse: (response, handler) {

        print('Received responsess: ${response.statusCode}');


        print('Received: ${response.data}');


        return handler.next(response);


      },
      onError: (DioException e, handler) async {


        int retryCount = 0;
        int maxRetries = 3;
        while (retryCount < maxRetries && e.type == DioExceptionType.connectionTimeout) {
          retryCount++;
          try {


            print('Connection timeout, retrying...');
            final res = await dio.request(e.requestOptions.path);
            return handler.resolve(res);
          } catch (e) {
            print(e.toString());
          }
        }
        return handler.next(e);
      },
    ));

  }


  @override
  Future getApi(String url) async {
    dynamic responseJson;

    try {
      print("eehdehdeh:");

      // var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));

      var response = await dio.get(url,
        options: Options(
          headers: {
            'x-access-token': accessToken,
          },
        ),
      );


      print("tttttststs" + response.data.toString());

      responseJson = returnResponse(response);


    } on SocketException {


      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;






  }

  @override
  Future postApi(Map<String, dynamic> map, url) async {
    dynamic responseJson;
    try {


      print("first 1" );



      var data =jsonEncode(map);

      // var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      var response = await dio.post(url,data: data);



      print("tttttststs" + response.data.toString());

      responseJson = returnResponse(response);
    } on
    DioException catch (e) {
      print('DioException: ${e.message}');


      if (e.response != null) {
        print('Response Data: ${e.response!.data}');
        print('Response Status Code: ${e.response!.statusCode}');


        if (e.response!.statusCode == 400) {


          var responseData = e.response!.data;
          String errorMessage = responseData['message'] ?? 'Unknown error';

          Fluttertoast.showToast(
            msg: errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,


            fontSize: 16.0,
          );


          throw InvalidUrl('Bad request: ${e.response!.data}');
        }

        else
        if (e.response!.statusCode == 201) {
          throw InvalidUrl('201 request: ${e.response!.data}');
        }

        else {
          throw FetchDataException(
              'Error occurred while communicating with server');
        }
      }
    }
    on

    SocketException {
      print("qqqqq");
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("Connection time out");
    }

    return responseJson;
  }






  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      //    dynamic responsejson = jsonDecode(response.body);



        dynamic responsejson = response.data;



        print(response.statusCode);
        return responsejson;
      case 400:
        throw InvalidUrl;
      default:
        throw FetchDataException("Error occurred while communicating with server");
    }
  }








}





