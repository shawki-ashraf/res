import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_response.dart';
import 'end_points.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() {
    _instance.initDio();
    return _instance;
  }
  ApiHelper._init();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseURL,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  void initDio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("--- Headers : ${options.headers.toString()}");
          print("--- endpoint : ${options.path.toString()}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // ignore: avoid_print
          print("--- Response : ${response.data.toString()}");
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          print("--- Error : ${error.response?.data.toString()}");
          if (error.response?.data['message'].contains('expired')) {
            try {
              ApiResponse apiResponse = await _instance.postRequest(
                endPoint: EndPoints.refreshToken,
                sendRefreshToken: true,
                isProtected: true,
              );
              if (apiResponse.status) {
                var sharedPref = await SharedPreferences.getInstance();
                await sharedPref.setString(
                  'access_token',
                  apiResponse.data['access_token'],
                );

                final options = error.requestOptions;
                // if (options.data is FormData) {
                //   final oldFormData = options.data as FormData;

                //   final Map<String, dynamic> formMap = {};
                //   for (var entry in oldFormData.fields) {
                //     formMap[entry.key] = entry.value;
                //   }

                //   for (var file in oldFormData.files) {
                //     formMap[file.key] = file.value;
                //   }

                //   options.data = FormData.fromMap(formMap);
                // }
                if (options.data is FormData) {
                  final oldFormData = options.data as FormData;

                  final newFormData = FormData();

                  for (var entry in oldFormData.fields) {
                    newFormData.fields.add(MapEntry(entry.key, entry.value));
                  }

                  for (var file in oldFormData.files) {
                    newFormData.files.add(MapEntry(file.key, file.value));
                  }

                  options.data = newFormData;
                }
                options.headers['Authorization'] =
                    'Bearer ${sharedPref.getString('access_token') ?? ''}';
                final response = await dio.fetch(options);
                return handler.resolve(response);
              } else {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('access_token');
                sharedPreferences.remove('refresh_token');
                return handler.next(error);
              }
            } catch (e) {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('access_token');
              sharedPreferences.remove('refresh_token');
              return handler.next(error);
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
    bool sendRefreshToken = false,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString(
        sendRefreshToken ? 'refresh_token' : 'access_token',
      );
    }
    return ApiResponse.fromResponse(
      await dio.post(
        endPoint,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {if (isProtected) 'Authorization': 'Bearer $token'},
        ),
      ),
    );
  }

  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
    bool isProtected = false,
    bool sendRefreshToken = false,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString(
        sendRefreshToken ? 'refresh_token' : 'access_token',
      );
    }
    return ApiResponse.fromResponse(
      await dio.get(
        endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {if (isProtected) 'Authorization': 'Bearer $token'},
        ),
      ),
    );
  }

  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
    bool isProtected = false,
    bool sendRefreshToken = false,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString(
        sendRefreshToken ? 'refresh_token' : 'access_token',
      );
    }
    return ApiResponse.fromResponse(
      await dio.put(
        endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {if (isProtected) 'Authorization': 'Bearer $token'},
        ),
      ),
    );
  }

  Future<ApiResponse> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
    bool isProtected = false,
    bool sendRefreshToken = false,
  }) async {
    String? token;
    if (isProtected) {
      var sharedPref = await SharedPreferences.getInstance();
      token = sharedPref.getString(
        sendRefreshToken ? 'refresh_token' : 'access_token',
      );
    }
    return ApiResponse.fromResponse(
      await dio.delete(
        endPoint,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {if (isProtected) 'Authorization': 'Bearer $token'},
        ),
      ),
    );
  }
}
