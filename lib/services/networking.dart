import 'dart:io';

import 'package:dio/dio.dart';
import 'package:purple_toko/models/response/data_response.dart';
import 'package:purple_toko/models/response/login_response.dart';

class NetworkHelper {
  final String url;
  final dio = Dio();
  NetworkHelper(this.url);

  Future<LoginResponse> login(
      String email, String password, String userType) async {
    try {
      var formData = FormData.fromMap(
        {'username': email, 'password': password, 'usertype': userType},
      );
      var response = await dio.post(
        '$url/RestApi/login_user',
        data: formData,
      );
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      print('Http Error ${e.response}');
      throw HttpException(e.message);
    }
  }

  Future<DataResponse> getData(
      {double latitude = 28.6210,
      double longitude = 77.3812,
      double distance = 20}) async {
    try {
      var formData = FormData.fromMap(
        {'latitude': latitude, 'longitude': longitude, 'distance': distance},
      );
      var response = await dio.post(
        '$url/RestApi/fetch_shops_by_distance',
        data: formData,
      );
      if (response.statusCode == 200)
        return DataResponse.fromJson(response.data);
      else
        throw HttpException(response.statusMessage!);
    } on DioError catch (e) {
      print('Http Error ${e.response}');
      throw HttpException(e.message);
    }
  }
}
