import 'package:get/get.dart';
import 'package:users_api_app/feature/users/domain/usecases/get_user.dart';

import '../../domain/entities/user.dart';

class UserController extends GetxController {
  final GetUsers getUsers;

  UserController(this.getUsers);

  final RxList<User> users = <User>[].obs;

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;

      errorMessage.value = '';

      final result = await getUsers();

      users.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
