import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.surface,
        appBar: const CustomAppBar(
          title: 'إنشاء حساب جديد',
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
              right: -50,
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
              bottom: 50,
              left: -30,
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
                          width: 70,
                          height: 70,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'انضم إلينا الآن',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'أنشئ حسابك للاستفادة الكاملة من كافة الخدمات الرقمية التي توفرها المحافظة.',
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
                            if (value.length < 6) {
                              return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Register Button
                      Obx(
                        () => PrimaryButton(
                          label: 'إنشاء حساب آمن',
                          onPressed: controller.register,
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لديك حساب بالفعل؟',
                            style: TextStyle(
                              color: AppColors.textPrimary.withValues(alpha: 0.6),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'تسجيل الدخول',
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
