// ignore_for_file: file_names

import 'package:notary_ping/src/states/profile/ProfileController.dart';
import 'package:notary_ping/src/utility/SubmitButton.dart';

import '../../../../index.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'Edit Profile'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 70,
              width: 70,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          user,
                          fit: BoxFit.fill,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Palette.primaryColor,
                        radius: 10,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Palette.whiteColor,
                          size: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Mansurul Hoque".tr,
            style: TextStyles.headlineSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          CustomTextField(
            hintText: 'Enter your name'.tr,
            onChange: (value) {
              // controller.state.name = value;
            },
            prefixIcon: userIcon,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Enter your address'.tr,
            onChange: (value) {
              // controller.state.name = value;
            },
            maxline: 3,
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
                  focusnode: focusNode,
                  onEditingComplete: onFieldSubmitted,
                  controller: textEditingController,
                  hintText: 'City'.tr,
                  onChange: (value) {
                    // controller.state.categoryName = value;
                  },
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
            hintText: 'State'.tr,
            onChange: (value) {
              // controller.state.name = value;
            },
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Zip code'.tr,
            onChange: (value) {
              // controller.state.name = value;
            },
          ),
          SizedBox(height: 80.h),
          SubmitButton(
            title: 'Update'.tr,
            onTap: () {},
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}