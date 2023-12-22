// ignore_for_file: file_names,

import 'package:notary_ping/src/states/profile/ProfileController.dart';

import '../../../../index.dart';

class ReportNotary extends StatefulWidget {
  const ReportNotary({super.key});

  @override
  State<ReportNotary> createState() => _ReportNotaryState();
}

class _ReportNotaryState extends State<ReportNotary> {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        title: 'Report this notary'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
                color: Palette.whiteColor, borderRadius: BorderStyles.normal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    user1,
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mansurul Hoque".tr,
                        style: TextStyles.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Lawyer".tr,
                        style: TextStyles.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              "Lafayette, California 90001 ",
                              style: TextStyles.bodyMedium,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            locationProfileIcon,
                            height: 16,
                            width: 16,
                            fit: BoxFit.contain,
                            color: Palette.greyTextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          LayoutBuilder(
            builder: (context, constraints) => RawAutocomplete<String>(
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      // height: 200.0,
                      width: constraints.biggest.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              initialValue: TextEditingValue(
                text: controller.state.slectedCity.value,
              ),
              optionsBuilder: (textValue) {
                if (textValue.text.isEmpty) {
                  return List.empty();
                } else {
                  if (textValue.text.length == 1) {
                    controller.state.slectedCity.value = "";
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  } else {
                    controller.state.slectedCity.value = textValue.text;
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  }
                }
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return CustomTextField(
                  fillColor: Palette.whiteColor,
                  focusnode: focusNode,
                  onEditingComplete: onFieldSubmitted,
                  controller: textEditingController,
                  hintText: 'Report type'.tr,

                  onChange: (value) {},
                  // prefixIcon: cityIcon,
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Palette.primaryColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            fillColor: Palette.whiteColor,
            maxline: 5,
            hintText: 'Description'.tr,
            onChange: (value) {},
            // prefixIcon: stateIcon,
          ),
          SizedBox(height: 0.3.sh),
          SubmitButton(
            onTap: () {},
            title: "Submit report".tr,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
