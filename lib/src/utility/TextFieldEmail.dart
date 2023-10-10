import 'package:flutter/material.dart';
import 'package:notary_ping/styles.dart';

class TextFieldEmail extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? hint;

  const TextFieldEmail({
    Key? key,
    this.onChanged,
    this.hint,
  }) : super(key: key);

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width - 40,
      height: 45,
      child: TextField(
        onChanged: widget.onChanged,
        style: TextStyles.textField,
        cursorColor: Palette.primaryColor,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hint ?? 'Enter your Email',
          prefixIcon: const Icon(
            Icons.mail,
            color: Palette.primaryColor,
            size: 22,
          ),
          hintStyle: TextStyles().textFieldHint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
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
      ),
    );
  }
}
