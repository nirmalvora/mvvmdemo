import 'package:dio/dio.dart' hide Headers;
import 'package:mvvmdemo/core/constants/service_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ServiceConstants.BASE_URL)
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;

  // get posts
  @GET(ServiceConstants.API_POSTS)
  Future<dynamic> getPostData();
}
