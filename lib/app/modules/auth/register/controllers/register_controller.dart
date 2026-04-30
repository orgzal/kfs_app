import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'name',
    'email',
    'password',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'canSubmit': true,
    'accountType': 'citizen',
  }.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool obscurePassword = true.obs;

  Future<void> register() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    isLoading.value = true;

    await Future<void>.delayed(const Duration(milliseconds: 800));

    mockData['canSubmit'] = false;
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
