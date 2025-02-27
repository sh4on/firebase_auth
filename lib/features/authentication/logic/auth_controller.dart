import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<RxStatus> status = Rx<RxStatus>(RxStatus.success());

  Future<void> createUserWithEmailAndPassword(
      String emailAddress, String password) async {
    status.value = RxStatus.loading();

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      status.value = RxStatus.success();

      // show toast
      Get.snackbar('',
          'Your account has been successfully created. You can now log in.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        status.value = RxStatus.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        status.value =
            RxStatus.error('The account already exists for that email.');
      } else {
        status.value = RxStatus.error(e.toString());
      }
    } catch (e) {
      status.value = RxStatus.error(e.toString());
    }
  }

  Future<bool> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    status.value = RxStatus.loading();

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      status.value = RxStatus.success();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        status.value = RxStatus.error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        status.value = RxStatus.error('Wrong password provided for that user.');
      } else {
        status.value = RxStatus.error(e.toString());
      }
    } catch (e) {
      status.value = RxStatus.error(e.toString());
    }

    return false;
  }
}
