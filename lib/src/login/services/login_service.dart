import 'package:dio/dio.dart';

class LoginService {
  final dio =
      Dio(BaseOptions(baseUrl: const String.fromEnvironment('API_BASE_URL')));

  Future<Response?> login(String username, String password) async {
    try {
      var response = await dio.post(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
