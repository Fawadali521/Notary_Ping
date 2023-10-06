
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
      decoration:   InputDecoration(
        hintText: hintText ?? 'Enter email',
        prefixIcon:prefixIcon  ,
        suffixIconColor: Colors.orange,
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.hintText.copyWith(
            fontWeight: FontWeight.normal
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
        filled: true,
        fillColor:  Palette.blue3,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:BorderSide(width: 1.0,color: Palette.blue1.withOpacity(0.1))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:   BorderSide(width: 1.0,color: Colors.grey.withOpacity(0.1),


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
