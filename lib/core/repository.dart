import 'package:dio/dio.dart';
import 'package:ff14_mobile_app/config/ff14.dart';

class Repository {

  /// Perform a get request
  getHttp(String endpoint) async {
    try {
      return await Dio().get(FF14.api + endpoint);
    } catch (e) {
      //throw Exception(e);
    }
  }

}