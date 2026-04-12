import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final Color fillColor;
  final double borderRadius;
  final double? height;
  final double? width;
  final double? labelFontSize;
  final Color? labelColor;
  final TextEditingController? controller;

  final Widget? prefixIcon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.fillColor,
    this.borderRadius = 12,
    this.height,
    this.width,
    this.labelFontSize,
    this.labelColor,
    this.controller,
    this.prefixIcon,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,

          // ✅ FIX 1: use hintText instead of labelText
          hintText: widget.labelText,
          hintStyle: TextStyle(
            fontSize: widget.labelFontSize,
            color: widget.labelColor,
          ),

          // ✅ FIX 2: padding around prefix icon
          prefixIcon: widget.prefixIcon != null
              ? Padding(padding: EdgeInsets.all(12.w), child: widget.prefixIcon)
              : (widget.isPassword
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.lock_outline),
                      )
                    : null),

          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
