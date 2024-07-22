import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  final getput = Get.put(RegisterController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(
                //       "assets/bg/splash1.png"), // Path gambar latar belakang
                //   fit: BoxFit
                //       .cover, // Menyesuaikan gambar agar sesuai dengan ukuran Container
                // ),
              ),
              child: Center(
                child: Card(
                  margin: EdgeInsets.fromLTRB(20,120,20,20),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20,20,20,20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        _buildNamaTextField(),
                        SizedBox(height: 20),
                        _buildEmailTextField(),
                        SizedBox(height: 20),
                        _buildPasswordTextField(),
                        SizedBox(height: 20),
                        _buildPasswordTextFieldConfirm(),
                        SizedBox(height: 20),
                        _buildLoginButton(),
                        SizedBox(height: 10),
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
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Obx(() => TextFormField(
          controller: passwordController,
          obscureText: !controller.isPasswordVisible.value,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
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

  Widget _buildPasswordTextFieldConfirm() {
    return Obx(() => TextFormField(
          controller: passwordController,
          obscureText: !controller.isPasswordVisible.value,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
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
        Get.toNamed('/login');
      },
      child: Text(
        'Sudah Punya akun?Login',
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

        print('Email: $email');
        print('Password: $password');
        Get.toNamed('/home');
      },
      child: Text('Register'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildNamaTextField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Nama',
        border: OutlineInputBorder(),
      ),
    );
  }
}
