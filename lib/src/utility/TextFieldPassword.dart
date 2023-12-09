// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../styles.dart';

class PasswordField extends StatefulWidget {
  final String? hint;
  final ValueChanged<String>? onChanged;
  const PasswordField({
    super.key,
    this.hint,
    this.onChanged,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width - 40,
      height: 45,
      child: TextField(
        onChanged: widget.onChanged,
        autofocus: false,
        obscureText: _obscureText ? true : false,
        style: TextStyles.textField,
        cursorColor: Palette.primaryColor,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hint ?? 'Enter your Password',
          prefixIcon: const Icon(
            Icons.lock,
            color: Palette.primaryColor,
            size: 22,
          ),
          hintStyle: TextStyles().textFieldHint,
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
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: _obscureText
                    ? Palette.secondaryColor
                    : Palette.primaryColor,
                size: 20,
              )),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
        ),
      ),
    );
  }
}
