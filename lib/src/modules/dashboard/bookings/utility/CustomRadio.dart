// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomRadio extends StatelessWidget {
  final Color color;
  const CustomRadio({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: color,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: Palette.whiteColor,
        child: CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
      ),
    );
  }
}
