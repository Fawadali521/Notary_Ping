// ignore_for_file: file_names

import '../../../../index.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteColor,
        appBar: CustomAppBar(
          color: Palette.whiteColor,
          title: 'Privacy policy'.tr,
          isBack: true,
        ),
        body: const Center(child: Text("terms and condition")));
  }
}
