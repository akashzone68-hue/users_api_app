import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:users_api_app/feature/users/data/datasource/user_remote_data_source.dart';
import 'package:users_api_app/feature/users/domain/usecases/get_user.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/repositories/user_repository_impl.dart';

import '../../domain/repositories/user_repository.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => DioClient().dio);

    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource(Get.find<Dio>()));

    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find<UserRemoteDataSource>()),);

    Get.lazyPut<GetUsers>(() => GetUsers(Get.find<UserRepository>()));

    Get.lazyPut<UserController>(() => UserController(Get.find<GetUsers>()));
  }
}
