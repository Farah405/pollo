import 'package:dio/dio.dart';

class AuthService {

  final Dio dio = Dio();

  final String baseUrl = 'PUT_API_BASE_URL';

  bool get isDemoMode => baseUrl == 'PUT_API_BASE_URL';

  Future login({

    required String email,

    required String password,
  }) async {

    await dio.post(

      '$baseUrl/login',

      data: {

        'email': email,

        'password': password,
      },
    );
  }
}