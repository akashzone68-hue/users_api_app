import 'package:flutter/material.dart';
import 'package:users_api_app/feature/users/data/datasource/user_remote_data_source.dart';
import 'package:users_api_app/feature/users/domain/usecases/get_user.dart';

import '../../../../core/network/dio_client.dart';

import '../../data/repositories/user_repository_impl.dart';

import '../../domain/entities/user.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final GetUsers getUsers;

  List<User> users = [];

  bool isLoading = false;

  String? errorMessage;

  @override
  void initState() {
    super.initState();

    final dio = DioClient().dio;

    final dataSource = UserRemoteDataSource(dio);

    final repository = UserRepositoryImpl(dataSource);

    getUsers = GetUsers(repository);

    fetchUsers();
  }

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result = await getUsers();

      if (!mounted) return;

      setState(() {
        users = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users API'),
        actions: [
          IconButton(onPressed: fetchUsers, icon: const Icon(Icons.refresh)),
        ],
      ),

      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(errorMessage!),

            const SizedBox(height: 10),

            ElevatedButton(onPressed: fetchUsers, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (users.isEmpty) {
      return const Center(child: Text('No users found'));
    }

    return RefreshIndicator(
      onRefresh: fetchUsers,

      child: ListView.builder(
        itemCount: users.length,

        itemBuilder: (context, index) {
          final user = users[index];

          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: CircleAvatar(child: Text(user.name[0])),

              title: Text(user.name),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.username),
                  Text(user.email),
                  Text(user.address.city),
                  Text(user.company.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
