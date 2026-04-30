import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.surface,
        appBar: const CustomAppBar(
          title: 'تسجيل الدخول',
          subtitle: 'كفر الشيخ الرقمية',
          showSearchField: true,
          showSearchAction: false,
          showDrawerAction: true,
        ),
        body: Stack(
          children: [
            // Decorative Background Elements
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.03),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              right: -30,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo Branding
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.surface,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'مرحباً بك مجدداً',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'استخدم بيانات حسابك للوصول إلى الخدمات الحكومية المتاحة عبر البوابة.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary.withValues(alpha: 0.6),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                      // Email Field
                      CustomTextField(
                        controller: controller.emailController,
                        labelText: 'البريد الإلكتروني',
                        hintText: 'name@example.com',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        prefixIcon: Icon(Icons.email_outlined, color: AppColors.primary),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'يرجى إدخال البريد الإلكتروني';
                          }
                          if (!GetUtils.isEmail(value.trim())) {
                            return 'يرجى إدخال بريد إلكتروني صحيح';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      
                      // Password Field
                      Obx(
                        () => CustomTextField(
                          controller: controller.passwordController,
                          labelText: 'كلمة المرور',
                          hintText: '********',
                          obscureText: controller.obscurePassword.value,
                          textInputAction: TextInputAction.done,
                          prefixIcon: Icon(Icons.lock_outline, color: AppColors.primary),
                          suffixIcon: IconButton(
                            onPressed: controller.togglePasswordVisibility,
                            icon: Icon(
                              controller.obscurePassword.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.primary.withValues(alpha: 0.5),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'يرجى إدخال كلمة المرور';
                            }
                            return null;
                          },
                        ),
                      ),
                      
                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Login Button
                      Obx(
                        () => PrimaryButton(
                          label: 'دخول آمن',
                          onPressed: controller.login,
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Registration Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ليس لديك حساب؟',
                            style: TextStyle(
                              color: AppColors.textPrimary.withValues(alpha: 0.6),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed('/register'),
                            child: Text(
                              'إنشاء حساب جديد',
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
