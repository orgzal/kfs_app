import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<String> mockItems = <String>[
    'email',
    'phone',
    'address',
  ].obs;
  final RxMap<String, dynamic> mockData = <String, dynamic>{
    'supportAvailable': true,
    'workingHours': '09:00-17:00',
  }.obs;

  final String phone = '+20 47 123 4567';
  final String email = 'info@kfs.gov.eg';
  final String address = 'محافظة كفر الشيخ، جمهورية مصر العربية';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> submitContactForm() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    isLoading.value = true;

    await Future<void>.delayed(const Duration(milliseconds: 800));

    isLoading.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
