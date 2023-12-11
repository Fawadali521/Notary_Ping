// ignore_for_file: file_names

import '../../../../index.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteColor,
        appBar: CustomAppBar(
          color: Palette.whiteColor,
          title: 'Terms and conditions'.tr,
          isBack: true,
        ),
        body: const Center(child: Text("terms and condition")));
  }
}
