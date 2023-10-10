 import 'package:flutter/material.dart';

import '../../styles.dart';

class PasswordField extends StatefulWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  const PasswordField({
    super.key,
    required this.hint,
    this.onChanged,
    this.prefixIcon
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      autofocus: false,
      obscureText: _obscureText ? true : false,
      style: TextStyles.bodyText,
      cursorColor: Palette.primaryColor,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hint,
        prefixIcon: widget.prefixIcon,
        hintStyle: TextStyles.hintText.copyWith(fontWeight: FontWeight.normal),
        border: const OutlineInputBorder(
          borderRadius: BorderStyles.textFieldBorderRadius,
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.1))),
        filled: true,
        fillColor: Palette.textFieldFill,
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText ? _obscureText = false : _obscureText = true;
              });
            },
            child: Icon(
              _obscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: _obscureText ? Palette.secondaryColor : Palette.primaryColor,
              size: 20,
            )),
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
      ),
    );
  }
}
