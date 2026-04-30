import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../controllers/training_controller.dart';

class TrainingView extends GetView<TrainingController> {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Training'),
      body: const Center(child: Text('Training')),
    );
  }
}
