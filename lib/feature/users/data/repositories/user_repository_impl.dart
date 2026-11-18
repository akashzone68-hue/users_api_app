import 'package:users_api_app/feature/users/data/datasource/user_remote_data_source.dart';
import 'package:users_api_app/feature/users/domain/entities/user.dart';
import 'package:users_api_app/feature/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers()async {
    return await remoteDataSource.getUsers();
  }
}