
import 'package:flutter/material.dart';

import '../../styles.dart';

// Text field widget by AsimKhan1122

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon
  });
final String? hintText;
final Icon? prefixIcon;
final Icon? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.bodyText,
      decoration:   InputDecoration(
        hintText: hintText ?? 'Enter email',
        prefixIcon:prefixIcon  ,
        suffixIconColor: Palette.primaryColor,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.hintText.copyWith(
            fontWeight: FontWeight.normal
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:BorderSide(width: 1.0,color:Colors.black.withOpacity(0.5))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:   const BorderSide(width: 1.0,color: Palette.primaryColor,


          ),




        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:   BorderSide(width: 1.0,color: Colors.grey.withOpacity(0.1))),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:   BorderSide(width: 1.0,color: Colors.grey.withOpacity(0.1))),
      ),
    );
  }
}
