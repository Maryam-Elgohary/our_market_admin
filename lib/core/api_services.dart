import 'package:dio/dio.dart';
import 'package:our_market_admin/core/functions/sensitive_data.dart';

// Define authKey variable
const String authKey = 'your_auth_key_here';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://itjstiahcigzhbrwggfz.supabase.co/rest/v1/",
      headers: {
        "apiKey": anonKey,
      },
    ),
  );

  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }

  Future<Response> postData(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> patchData(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }

  Future<Response> deleteData(String path) async {
    return await _dio.delete(path);
  }

  Dio _dioAuth = Dio(
    BaseOptions(
      baseUrl: "https://itjstiahcigzhbrwggfz.supabase.co/auth/v1/",
      headers: {
        "apiKey": anonKey,
      },
    ),
  );

  Future<Response> createAnAccount(
      String endpoint, Map<String, dynamic> data) async {
    return await _dioAuth.post(endpoint, data: data);
  }
}
