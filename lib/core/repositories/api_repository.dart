import 'package:dio/dio.dart';
import 'package:mvvmdemo/core/constants/service_constants.dart';
import 'package:mvvmdemo/core/services/api_service.dart';

class APIRepository {
  final APIService _apiService =
      APIService(Dio(), baseUrl: ServiceConstants.BASE_URL);

  // Login
  Future<dynamic> getPostData() async {
    return await _apiService.getPostData().catchError((onError) {
      throw onError;
    });
  }
}
