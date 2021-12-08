
import 'package:http/http.dart' as http ;
import 'package:tirs_car/model/Response/home_data_response.dart';
import 'dart:convert'show json;
import 'dart:async';
import 'package:tirs_car/utils/common.dart';



Future<HomeDataResponse> getHomeDataAPI () async {
  final response = await http.get(Uri.parse(AppConfig.MAIN_API_URL+"home"),headers: AppConfig.setHeader());
  print(response.statusCode);
  if (response.statusCode == 200){
    return HomeDataResponse.fromJson(json.decode(response.body));
  } else {
    ErrorResponse res = ErrorResponse.fromJson(json.decode(response.body));
    throw Exception(res.message);

  }
}



