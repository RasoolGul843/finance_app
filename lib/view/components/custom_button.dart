import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double borderRadius;

  final String? leftIcon; // asset path
  final String? rightIcon; // asset path
  final double iconSize;

  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius = 12,
    this.leftIcon,
    this.rightIcon,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔵 Left Icon
            if (leftIcon != null) ...[
              Image.asset(leftIcon!, height: iconSize, width: iconSize),
              SizedBox(width: 8),
            ],

            // 🔵 Text
            Text(
              text,
              style:
                  textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),

            // 🔵 Right Icon
            if (rightIcon != null) ...[
              SizedBox(width: 8),
              Image.asset(rightIcon!, height: iconSize, width: iconSize),
            ],
          ],
        ),
      ),
    );
  }
}
