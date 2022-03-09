import 'package:json_annotation/json_annotation.dart';
import 'package:purple_toko/models/data.dart';

part 'data_response.g.dart';

@JsonSerializable()
class DataResponse {
  final int error_code;
  final String response_string;
  List<Market> data;
  DataResponse(
      {required this.error_code,
      required this.response_string,
      required this.data});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  List<Market> getData() {
    if (error_code == 1 && response_string == 'OK') {
      return data;
    }
    return [];
  }

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
