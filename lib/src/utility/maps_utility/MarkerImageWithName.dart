// ignore_for_file: file_names

import '../../../index.dart';

class MarkerImageWithName extends StatelessWidget {
  final String imgUrl;
  final String name;
  final Color borderColor;
  const MarkerImageWithName({
    super.key,
    required this.borderColor,
    required this.imgUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      // height: 190,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 85),
            width: 200,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  nameMIcon,
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Center(
                child: Text(
                  name,
                  style: TextStyles.titleSmall.copyWith(
                    color: Palette.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 90,
              height: 100,
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
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 3, bottom: 15),
                child: ClipOval(
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
