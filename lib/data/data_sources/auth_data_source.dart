import 'package:dio/dio.dart';
import 'package:shop_n_goo/api_constants.dart';
import 'package:shop_n_goo/data/models/auth/request/LoginRequest.dart';
import 'package:shop_n_goo/data/models/auth/request/register_request.dart';
import 'package:shop_n_goo/data/models/auth/response/login_response.dart';
import 'package:shop_n_goo/data/models/auth/response/register_response.dart';

class AuthDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post("auth/login", data: loginRequest.toJson());
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      throw(exception.toString());
    }
  }
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _dio.post("auth/register", data: registerRequest.toJson());
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      print(exception.toString());
      throw(exception.toString());
    }
  }
}
