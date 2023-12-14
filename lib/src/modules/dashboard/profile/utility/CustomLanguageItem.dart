// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomLanguageItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String vlaue;
  final String groupValue;
  final void Function(String?)? onTap;

  const CustomLanguageItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.vlaue,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderStyles.medium,
        border: Border.all(
          color: Palette.languageBorderColor,
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              imgUrl,
              fit: BoxFit.contain,
              height: 24,
              width: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              name,
              style: TextStyles.bodyMedium.copyWith(
                fontSize: 16,
                color: Palette.blackColor,
              ),
            ),
          ),
          const Spacer(),
          Transform.scale(
            scale: 1.5,
            child: Radio(
              activeColor: Palette.primaryColor,
              value: vlaue,
              groupValue: groupValue,
              onChanged: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
