import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/helpers/validators.dart';
import '../logic/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: emailValidator,
                ),
                SizedBox(height: 10),

                
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: passwordValidator,
                ),
                SizedBox(height: 20),

                
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        authController.login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                    child: Text("Login"),
                  ),
                ),

                SizedBox(height: 20),

                
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
