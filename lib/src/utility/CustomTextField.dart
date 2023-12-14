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
    this.prefixIconColor,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
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
  final Color? prefixIconColor;
  final Color? fillColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;

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
    return 
    TextFormField(
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
        contentPadding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
        alignLabelWithHint: true,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Image.asset(
                  widget.prefixIcon!,
                  height: 20,
                  width: 20,
                  color: widget.prefixIconColor ?? Palette.primaryColor,
                  fit: BoxFit.contain,
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
                  padding: EdgeInsets.only(right: 16.w, left: 16.w),
                  child: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Palette.primaryColor,
                    size: 20,
                  ),
                ),
              )
            : widget.suffixIcon,
        counterText: '',
        fillColor: widget.fillColor ?? Palette.bgTextFeildColor,
        filled: true,
        hintText: widget.hintText.tr,
        hintStyle: TextStyles.bodyMedium,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderStyles.normal,
          borderSide: BorderSide(
            color: widget.borderColor ?? Palette.bgTextFeildColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderStyles.normal,
          borderSide: BorderSide(
            color: widget.borderColor ?? Palette.bgTextFeildColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderStyles.normal,
          borderSide: BorderSide(
            color: widget.borderColor ?? Palette.bgTextFeildColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderStyles.normal,
          borderSide: BorderSide(
            color: widget.borderColor ?? Palette.bgTextFeildColor,
          ),
        ),
      ),
    );
  }
}
