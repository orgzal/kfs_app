import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'email',
    'password',
    'rememberMe',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'isAuthenticated': false,
    'loginMethod': 'email',
  }.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool obscurePassword = true.obs;

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    isLoading.value = true;

    await Future<void>.delayed(const Duration(milliseconds: 800));

    mockData['isAuthenticated'] = true;
    isLoading.value = false;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
