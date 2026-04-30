import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kfs_governorate_app/app/core/theme/app_colors.dart';

class SelectionBox extends StatefulWidget {
  final double width;
  final IconData icon;
  final String title;
  final String? subTitle;
  const SelectionBox({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    this.subTitle,
  });

  @override
  State<SelectionBox> createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> hover = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: hover,
      builder: (context, isHover, child) {
        final f = NumberFormat.decimalPattern();
        return GestureDetector(
          onTap: () {},
          onPanStart: (_) {
            hover.value = true;
          },
          onPanEnd: (_) {
            hover.value = false;
          },
          onLongPressStart: (_) {
            hover.value = true;
          },
          onLongPressEnd: (_) {
            hover.value = false;
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Column(
              children: [
                Container(
                  height: widget.subTitle != null ? 160 : 180,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: isHover ? AppColors.primary : AppColors.colorWhite,
                    borderRadius: BorderRadius.circular(30),
                    border: BoxBorder.all(color: AppColors.primary),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.subTitle != null)
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(
                              begin: 0.0,
                              end: visible ? double.parse(widget.subTitle!) : 0,
                            ),
                            curve: Curves.easeOut,
                            duration: Duration(seconds: 1),
                            builder: (context, value, child) => Text(
                              f.format(value),
                              style: TextStyle(
                                color: isHover
                                    ? AppColors.colorWhite
                                    : AppColors.primary,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        else
                          Icon(
                            widget.icon,
                            color: isHover
                                ? AppColors.colorWhite
                                : AppColors.primary,
                            size: 40,
                          ),
                        const SizedBox(height: 20),
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: isHover
                                ? AppColors.colorWhite
                                : AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
