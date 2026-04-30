import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/primary_button.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'تواصل معنا'),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoCard(
                  icon: Icons.phone_outlined,
                  title: 'الهاتف',
                  value: controller.phone,
                ),
                const SizedBox(height: 12),
                _InfoCard(
                  icon: Icons.email_outlined,
                  title: 'البريد الإلكتروني',
                  value: controller.email,
                ),
                const SizedBox(height: 12),
                _InfoCard(
                  icon: Icons.location_on_outlined,
                  title: 'العنوان',
                  value: controller.address,
                ),
                const SizedBox(height: 24),
                Text(
                  'أرسل رسالة',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller.nameController,
                        labelText: 'الاسم',
                        hintText: 'الاسم الكامل',
                        prefixIcon: const Icon(Icons.person_outline),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'أدخل الاسم';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: controller.emailController,
                        labelText: 'البريد الإلكتروني',
                        hintText: 'name@example.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email_outlined),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'أدخل البريد الإلكتروني';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: controller.phoneController,
                        labelText: 'رقم الهاتف',
                        hintText: '+20',
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone_outlined),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'أدخل رقم الهاتف';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: controller.messageController,
                        labelText: 'الرسالة',
                        hintText: 'اكتب رسالتك هنا',
                        prefixIcon: const Icon(Icons.edit_note_rounded),
                        maxLines: 5,
                        minLines: 5,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'أدخل الرسالة';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => PrimaryButton(
                          label: 'إرسال',
                          onPressed: controller.submitContactForm,
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                    ],
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

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.10),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
