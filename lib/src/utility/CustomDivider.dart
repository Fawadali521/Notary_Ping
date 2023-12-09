// ignore_for_file: file_names

import '../../index.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Palette.blackColor.withOpacity(0.3),
      thickness: 1,
      height: 0,
      indent: 0,
      endIndent: 0,
    );
  }
}
