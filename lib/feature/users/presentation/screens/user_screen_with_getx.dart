import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../widgets/user_card.dart';

class UserScreenWithGetx extends GetView<UserController> {
  const UserScreenWithGetx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users API'),
        actions: [
          IconButton(
            onPressed: controller.fetchUsers,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: Obx(() {

        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(controller.errorMessage.value),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: controller.fetchUsers,
                  child: const Text('Retry'),
                ),

              ],
            ),
          );
        }

        if (controller.users.isEmpty) {
          return const Center(
            child: Text('No users found'),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.fetchUsers,

          child: ListView.builder(
            itemCount: controller.users.length,

            itemBuilder: (context, index) {
              final user = controller.users[index];

              return UserCard(user: user);
            },
          ),
        );

      }),
    );
  }
}
