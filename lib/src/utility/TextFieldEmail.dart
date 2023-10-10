
import 'package:flutter/material.dart';

import '../../styles.dart';

class TextFieldEmail extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const TextFieldEmail({
    Key? key,
    this.onChanged,
    this.initialText,
    this.suffixIcon,
    this.prefixIcon
  }) : super(key: key);

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  TextEditingController? _controller;



  @override
  void initState() {
    super.initState();
    if (widget.initialText != null) {
      _controller = TextEditingController(text: widget.initialText);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width - 40,
      height: 50,
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        style: TextStyles.bodyText,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.initialText ?? 'Enter your email',
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          hintStyle: TextStyles.hintText.copyWith(fontWeight: FontWeight.normal),
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
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

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}