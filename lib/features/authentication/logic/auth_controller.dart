import 'package:get/get.dart';

class AuthController extends GetxController {
  void login(String email, String password) {
    // Simulating a login request
    if (email == "test@example.com" && password == "password123") {
      Get.snackbar("Success", "Login Successful!", snackPosition: SnackPosition.BOTTOM);
      Get.offNamed('/home'); // Navigate to Home Screen
    } else {
      Get.snackbar("Error", "Invalid credentials", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
