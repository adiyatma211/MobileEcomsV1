import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final getput = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, 
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg/splash1.png"), 
            fit: BoxFit
                .fill,
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildEmailTextField(),
                  const SizedBox(height: 20),
                  _buildPasswordTextField(),
                  const SizedBox(height: 20),
                  _buildLoginButton(),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: _buildForgotPasswordText(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildPasswordTextField() {
    return Obx(() => TextFormField(
          controller: passwordController,
          obscureText: !controller.isPasswordVisible.value,
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.togglePasswordVisibility();
              },
              child: Icon(
                controller.isPasswordVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
        ));
  }
  Widget _buildForgotPasswordText() {
    return GestureDetector(
      onTap: () {
        // TODO: Implement forgot password functionality
        Get.toNamed('/register');
      },
      child: const Text(
        'Registrasi Akun',
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();
      // Implement login logic using email and password
      controller.login(email, password); // Panggil login() dari LoginController
        print('Email: $email');
        print('Password: $password');
      },
      child: const Text('Login'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}
