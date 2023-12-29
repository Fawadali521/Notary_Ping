// This file contains the definition of the CustomNotaryItem class, which is a widget used to display a custom notary item in the dashboard home screen.

// ignore_for_file: file_names
// This directive is used to ignore linting warnings related to file names.

import '../../../../../index.dart';

class CustomNotaryItem extends StatelessWidget {
  const CustomNotaryItem({
    super.key,
    this.isOnline,
    required this.imgUrl,
    required this.name,
  });

  // Properties
  final bool? isOnline;
  final String imgUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    // Widget build method
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: .18.sw,
            width: .18.sw,
            child: Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                        height: .18.sw,
                        width: .18.sw,
                      ),
                    ),
                  ),
                  isOnline == true
                      ? const Positioned(
                          right: 6,
                          child: CircleAvatar(
                            backgroundColor: Palette.greenColor,
                            radius: 6,
                          ),
                        )
                      : isOnline == false
                          ? const Positioned(
                              right: 6,
                              child: CircleAvatar(
                                backgroundColor: Palette.greyShadeTextColor,
                                radius: 6,
                              ),
                            )
                          : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            name,
            style: TextStyles.bodyMedium,
          ),
        ),
      ],
    );
  }
}
