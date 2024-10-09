import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onTap,
    this.isVisible = false,
    this.readOnly = false,
    this.isObscureText = false,
    this.onPressedIcon,
  });

  final String hintText;
  final TextEditingController? controller;
  final bool isObscureText;
  final bool isVisible;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      cursorColor: Pallete.gradient1,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isObscureText
            ? IconButton(
                onPressed: onPressedIcon ?? () {},
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
              )
            : const SizedBox(),
      ),
      validator: (val) {
        if (val!.trim().isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
      obscureText: isVisible,
    );
  }
}
