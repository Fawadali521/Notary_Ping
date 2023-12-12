// ignore_for_file: file_names

import '../../index.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Palette.blackColor.withOpacity(0.3),
      thickness: 1,
      height: 0,
      indent: 0,
      endIndent: 0,
    );
  }
}
