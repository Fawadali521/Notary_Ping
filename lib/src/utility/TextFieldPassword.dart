
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class TextFieldEmail extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? initialText;

  const TextFieldEmail({
    Key? key,
    this.onChanged,
    this.initialText,
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
        style: TextStyles.bodyBlack,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.initialText ?? 'Enter your email',
          suffixIcon: const Icon(
            Icons.mail,
            color: Palette.secondaryColor,
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Palette.primaryColor,
          ),
          hintStyle: TextStyles.bodyBlack,
          border:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.15),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
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