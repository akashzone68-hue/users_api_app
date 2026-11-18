import 'package:dio/dio.dart';
import 'package:users_api_app/core/constants/api_constants.dart';
import 'package:users_api_app/feature/users/data/models/user_model.dart';
import 'package:users_api_app/feature/users/domain/entities/user.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  Future<List<User>> getUsers() async {
    try {
      final resposne = await dio.get(ApiConstants.users);
      final List<dynamic> data = resposne.data;

      return data.map((json) {
        return UserModel.fromJson(Map<String, dynamic>.from(json));
      }).toList();
    } on DioException catch (e) {
      throw Exception(e.message ?? 'API request failed');
    }
  }
}
