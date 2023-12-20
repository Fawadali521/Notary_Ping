// ignore_for_file: file_names

import '../../index.dart';

class CustomDropDown extends StatelessWidget {
  final String selectedVal;
  final List<String> items;
  final void Function(String?)? onChanged;
  final Color? dropdownColor;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Widget? prefixIcon;
  const CustomDropDown({
    super.key,
    required this.items,
    required this.selectedVal,
    this.onChanged,
    this.dropdownColor,
    this.textStyle,
    this.buttonColor,
    this.prefixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.bgTextFeildColor,
        borderRadius: BorderStyles.normal,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          borderRadius: BorderStyles.normal,
          underline: Container(),
          icon: const SizedBox.shrink(),
          dropdownColor: dropdownColor ?? Palette.bgTextFeildColor,
          style: textStyle ?? TextStyles.titleSmall,
          value: selectedVal,
          alignment: Alignment.center,
          menuMaxHeight: 200,
          elevation: 0,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                alignment: Alignment.center,
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      TextStyles.bodySmall.copyWith(
                        color: Palette.blackColor,
                      ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
