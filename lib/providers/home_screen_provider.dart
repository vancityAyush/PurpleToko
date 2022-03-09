import 'package:flutter/material.dart';
import 'package:purple_toko/main.dart';
import 'package:purple_toko/models/data.dart';
import 'package:purple_toko/models/response/data_response.dart';
import 'package:purple_toko/services/networking.dart';

class HomeScreenProvider extends ChangeNotifier {
  NetworkHelper networkHelper = getIt<NetworkHelper>();
  List<Market> data = [];

  Future<List<Market>> loadData() async {
    DataResponse dataResponse = await networkHelper.getData();
    data = dataResponse.getData();
    return data;
  }
}
