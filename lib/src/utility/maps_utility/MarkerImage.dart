// ignore_for_file: file_names

import '../../../index.dart';

class MarkerImage extends StatelessWidget {
  final String imgUrl;
  final Color borderColor;
  const MarkerImage({
    super.key,
    required this.borderColor,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            borderColor,
            BlendMode.srcIn,
          ),
          image: const AssetImage(
            imgMIcon,
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 8),
        child: ClipOval(
          child: Image.asset(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
