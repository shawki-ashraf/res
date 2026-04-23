import 'package:dio/dio.dart';
import 'package:yumquick/features/auth/data/models/user_model.dart';

class AuthRepo {
  final Dio _dio;
  final String _baseUrl =
      "https://your-api-url.com/api/"; // Replace with your base URL

  AuthRepo(this._dio);

  Future<userModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await _dio.post(
        "${_baseUrl}login",
        data: {'email': email, 'password': password},
      );
      return userModel.fromJson(response.data);
    } on DioException catch (e) {
      // Extracting the error message from the backend response if it exists
      final String errorMessage =
          e.response?.data['message'] ?? "Something went wrong";
      throw errorMessage;
    } catch (e) {
      throw "An unexpected error occurred";
    }
  }

  Future<userModel> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await _dio.post(
        "${_baseUrl}register",
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );
      return userModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? "Registration failed";
      throw errorMessage;
    } catch (e) {
      throw "An unexpected error occurred";
    }
  }
}
