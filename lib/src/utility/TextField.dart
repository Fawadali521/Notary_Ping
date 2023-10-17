import 'package:flutter/material.dart';

import '../../styles.dart';

// Text field widget by AsimKhan1122

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.selectedDate});
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onTap; // Callback for date picker
  final DateTime? selectedDate; // Add selectedDate parameter

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: onTap !=
          null, // Make the field readonly if onTap callback is provided
      onTap: onTap,
      style: TextStyles.textField,
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter email',
        prefixIcon: prefixIcon,
        suffixIconColor: Palette.primaryColor,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles().textFieldHint,
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
