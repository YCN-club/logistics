import 'package:dio/dio.dart';
import 'package:mitblr_club_app/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: Constants.apiBaseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
  final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();
  String token = '';

  Future<Response?> validate() async {
    try {
      Response response = await _dio.get(
        '/jwt',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<Response?> login(String identifier, String secret) async {
    try {
      Response response = await _dio.post(
        '/login',
        data: {
          'auth_type': 'USER',
          'identifier': identifier,
          'secret': secret,
        },
      );
      token = response.data['identifier'];
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
