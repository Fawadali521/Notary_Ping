// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomNotaryItem extends StatelessWidget {
  const CustomNotaryItem({
    super.key,
    this.isOnline,
  });

  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
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
                        user,
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
            "Mickle".length > 10 ? "${"Mickle".substring(0, 7)}..." : "Mickle",
            style: TextStyles.bodyMedium,
          ),
        ),
      ],
    );
  }
}
