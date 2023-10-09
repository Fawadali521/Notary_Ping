import 'package:flutter/material.dart';

import '../../styles.dart';

// Text field widget by AsimKhan1122

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key, this.hintText, this.prefixIcon, this.suffixIcon});
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.bodyText,
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter email',
        prefixIcon: prefixIcon,
        suffixIconColor: Palette.primaryColor,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.hintText.copyWith(fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 3),
        filled: true,
        fillColor: Palette.textFieldFill,
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
      ),
    );
  }
}
