// ignore_for_file: file_names

import 'package:notary_ping/src/constant/time_formate.dart';

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
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Row(
            children: [
              Image.asset(
                conditionIcon,
                fit: BoxFit.contain,
                height: 60,
                width: 60,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Privacy policy".tr,
                    style: TextStyles.headlineSmall.copyWith(
                      color: Palette.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Text("${"Update".tr}${date.format(DateTime.now())}",
                      style: TextStyles.bodyMedium),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 24),
            child: Text(
              "Privacy policy".tr,
              style: TextStyles.titleLarge,
            ),
          ),
          Text(
            "15.2 Your privacy is important to us. To better protect your privacy, we are providing this notice explaining our policy with regards to the information you share with us. This privacy policy relates to the information we collect, online from Application, received through the email, by fax or telephone, or in person or in any other way and retain and use for the purpose of providing you services. If you do not agree to the terms in this Policy, we kindly ask you not to use these portals and/or sign the contract document."
                .tr,
            style: TextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
