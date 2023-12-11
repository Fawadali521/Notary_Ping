// ignore_for_file: file_names

import '../../index.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.onEditingComplete,
    this.validator,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.suffixIcon,
    this.maxline = 1,
    this.onChange,
    this.maxLength,
    this.intialValue,
    this.focusnode,
    this.onFieldSubmitted,
    this.onTap,
    this.expands,
    this.hintMaxLines,
    this.isuffixIconPassword,
  }) : super(key: key);

  final String? Function(String?)? validator;

  final void Function()? onEditingComplete;
  final String? intialValue;
  final String hintText;
  final String? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final int? maxline;
  final int? maxLength;
  final FocusNode? focusnode;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final bool? expands;
  final int? hintMaxLines;
  final bool? isuffixIconPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;
  @override
  void initState() {
    obscureText = widget.isuffixIconPassword == true ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      expands: widget.expands ?? false,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      initialValue: widget.intialValue,
      maxLength: widget.maxLength,
      focusNode: widget.focusnode,
      maxLines: widget.maxline,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyles.bodyMedium.copyWith(
        color: Palette.blackColor,
      ),
      keyboardType: widget.keyboardType ?? TextInputType.text,
      cursorColor: Palette.blackColor,
      obscureText: obscureText,
      controller: widget.controller,
      onChanged: widget.onChange,
      validator: widget.validator,
      decoration: InputDecoration(
        helperMaxLines: widget.hintMaxLines ?? 1,
        errorMaxLines: 3,
        contentPadding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 16.w, right: 20.w),
                child: Image.asset(
                  widget.prefixIcon!,
                  height: 24,
                  width: 24,
                  color: Palette.primaryColor,
                ),
              ),
        suffixIcon: widget.isuffixIconPassword == true
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w, left: 20.w),
                  child: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Palette.primaryColor,
                  ),
                ),
              )
            : widget.suffixIcon,
        counterText: '',
        fillColor: Palette.bgTextFeildColor,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyles.bodyMedium,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderStyles.normal,
          borderSide: const BorderSide(
            color: Palette.bgTextFeildColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderStyles.normal,
          borderSide: const BorderSide(
            color: Palette.bgTextFeildColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderStyles.normal,
          borderSide: const BorderSide(
            color: Palette.bgTextFeildColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderStyles.normal,
          borderSide: const BorderSide(
            color: Palette.bgTextFeildColor,
          ),
        ),
      ),
    );
  }
}
