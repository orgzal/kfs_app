import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kfs_governorate_app/app/core/constant/app_images.dart';
import 'package:kfs_governorate_app/app/core/theme/app_colors.dart';

List<Map<String, String>> data = [
  {"image": AppImages.mosque, "title": "مسجد إبراهيم الدسوقي"},
  {"image": AppImages.church, "title": "كنيسة العذراء مريم"},
  {"image": AppImages.edfo, "title": "قناطر ادفينا"},
];

class AnimatedPageViewTourism extends StatefulWidget {
  const AnimatedPageViewTourism({super.key});
  @override
  State<AnimatedPageViewTourism> createState() =>
      _AnimatedPageViewTourismState();
}

class _AnimatedPageViewTourismState extends State<AnimatedPageViewTourism> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      options: CarouselOptions(
        // enlargeFactor: 0.8
        height: 260,
        viewportFraction: 0.9,
        enlargeFactor: 0.3,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      itemBuilder: (context, int index, int realIndex) {
        bool isCenter = index == currentIndex;
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Opacity(
            opacity: isCenter ? 1.0 : 0.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(30),
                    child: Image.asset(
                      data[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: FittedBox(
                    child: Text(
                      data[index]['title']!.tr(),
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
