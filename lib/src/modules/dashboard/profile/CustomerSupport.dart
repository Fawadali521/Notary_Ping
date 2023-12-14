// ignore_for_file: file_names

import 'package:notary_ping/src/states/profile/ProfileController.dart';

import '../../../../index.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgTextFeildColor,
      appBar: CustomAppBar(
        color: Palette.bgTextFeildColor,
        title: 'Customer support'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.normal,
              color: Palette.whiteColor,
            ),
            child: ListTile(
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
              leading: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.primaryColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Image.asset(
                    messageIcon,
                    height: 24,
                    width: 24,
                    color: Palette.primaryColor,
                  ),
                ),
              ),
              title: Text(
                'Chat with support'.tr,
                style: TextStyles.titleLarge.copyWith(
                  color: Palette.primaryColor,
                ),
              ),
              subtitle: Text(
                'Our 24x7 customer service'.tr,
                style: TextStyles.bodySmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Palette.greyTextColor,
                size: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.normal,
              color: Palette.whiteColor,
            ),
            child: ListTile(
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
              leading: Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.primaryColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Image.asset(
                    emailIcon,
                    height: 24,
                    width: 24,
                    color: Palette.primaryColor,
                  ),
                ),
              ),
              title: Text(
                'holt@example.com'.tr,
                style: TextStyles.titleLarge.copyWith(
                  color: Palette.primaryColor,
                ),
              ),
              subtitle: Text(
                'Our 24x7 customer service'.tr,
                style: TextStyles.bodySmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Palette.greyTextColor,
                size: 16,
              ),
            ),
          ),
          const Text(
            "FAQ",
            style: TextStyles.titleSmall,
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.state.filteredFAQS.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: GestureDetector(
                  onTap: () {
                    controller.changeIsShowAnswer(index);
                    setState(() {});
                  },
                  child: Card(
                    elevation: 0,
                    color: Palette.whiteColor,
                    surfaceTintColor: Palette.whiteColor,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(18.sp),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    controller
                                        .state.filteredFAQS[index].question!,
                                    style: TextStyles.bodyLarge,
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                Icon(
                                  controller.state.filteredFAQS[index]
                                          .isShowAnswer!
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 24.sp,
                                  color: Palette.greyTextColor,
                                ),
                              ],
                            ),
                            controller.state.filteredFAQS[index].isShowAnswer!
                                ? Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: Text(
                                      controller
                                          .state.filteredFAQS[index].answer!,
                                      style: TextStyles.bodySmall,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
