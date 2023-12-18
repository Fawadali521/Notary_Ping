// ignore_for_file: file_names

import '../../index.dart';

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
      width: 110,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            width: 110,
            height: 35,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  nameMIcon,
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Center(
                child: Text(
                  name,
                  style: TextStyles.bodySmall.copyWith(
                    color: Palette.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
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
                padding:
                    const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 8),
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
