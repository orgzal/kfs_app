import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kfs_governorate_app/app/core/Constant/app_images.dart';
import 'package:kfs_governorate_app/app/core/theme/app_colors.dart';

List<String> imagesBackground = [
  AppImages.background1,
  AppImages.background3,
  AppImages.background2,
];

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.heightCarousal,
    required this.isDark,
  });

  final double heightCarousal;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: heightCarousal,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 3,
            options: CarouselOptions(
              scrollDirection: Axis.vertical,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 8),
              autoPlayAnimationDuration: Duration(seconds: 2),
              disableCenter: true,
              height: heightCarousal,
              aspectRatio: 1,
              viewportFraction: 1,
            ),
            itemBuilder: (context, int index, int realIndex) {
              return Image.asset(imagesBackground[index], fit: BoxFit.cover);
            },
          ),
        ),
        Positioned(
          child: SizedBox(
            height: heightCarousal,
            width: double.infinity,
            child: ColoredBox(
              color: isDark
                  ? AppColors.colorWhite.withValues(alpha: 0.08)
                  : AppColors.backgroundDark.withValues(alpha: 0.1),
            ),
          ),
        ),

        SizedBox(
          height: heightCarousal,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'رؤية وطنية',
                  style: TextStyle(fontSize: 15, color: AppColors.secondary),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'قيمنا',
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  textAlign: TextAlign.center,
                  // textDirection: TextDirection.rtl,
                  'الشفافية والتكامل والتقدم, مبادئ نسترشد بها لخدمة مواطنينا وبناء مستقبل واعد.',
                  style: TextStyle(color: AppColors.colorWhite, fontSize: 16),
                ),
              ],
            ).animate().slideY(),
          ),
        ),
      ],
    );
  }
}
