// ignore_for_file: file_names,

import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/Tracking.dart';
import 'package:notary_ping/src/modules/dashboard/notary_profile/utility/CustomDateTime.dart';
import 'package:notary_ping/src/states/profile/ProfileController.dart';

import '../../../../index.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final ProfileController controller = Get.find();
  int currentDateSelectedIndex = 0;
  bool isTrackingScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        title: 'Book appointment'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          RichText(
            text: TextSpan(
              text: "Please select your \npreferred appointment",
              style: TextStyles.headlineSmall,
              children: <TextSpan>[
                TextSpan(
                  text: "\ndate and time slot".tr,
                  style: TextStyles.headlineSmall
                      .copyWith(color: Palette.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          const Text(
            "Effortless notary booking streamlined services at your command secure, swift, and scheduled – your documents, our priority.",
            style: TextStyles.bodyMedium,
          ),
          SizedBox(height: 24.h),
          Text(
            "We’re currently available on following datest".tr,
            style: TextStyles.titleMedium,
          ),
          SizedBox(height: 16.h),
          _showDateCalendar(),
          SizedBox(height: 24.h),
          Text(
            "Select your preferred time slot".tr,
            style: TextStyles.titleMedium,
          ),
          SizedBox(height: 8.h),
          const Text(
            "The time slot is indicative, our surveyor will confirm more specific time prior to arrival",
            style: TextStyles.bodyMedium,
          ),
          SizedBox(height: 24.h),
          _showTimeCalerner(),
          SizedBox(height: 24.h),
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
                    return Infos().notaryServices.where((element) => element
                        .toLowerCase()
                        .contains(textValue.text.toLowerCase()));
                  } else {
                    controller.state.slectedCity.value = textValue.text;
                    return Infos().notaryServices.where((element) => element
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
                  hintText: 'Service type'.tr,

                  onChange: (value) {
                    // controller.state.categoryName = value;
                  },
                  // prefixIcon: cityIcon,
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Palette.primaryColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 0.08.sh),
          SubmitButton(
            onTap: () {
              showConfirmationBookingAlert(context);
            },
            title: "Continue".tr,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _showDateCalendar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back_ios,
          color: Palette.blackColor,
          size: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 30, //model.totalDays,
              // controller: model.scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return currentDateSelectedIndex == index
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        margin: EdgeInsets.only(right: 12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderStyles.normal,
                            color: Palette.whiteColor,
                            border: Border.all(
                              color: Palette.primaryColor,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              //  model.listOfDates[index].toString(),
                              DateTime.now()
                                  .add(Duration(days: index))
                                  .day
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyles.titleLarge,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              CustomDateTime.listOfDays[DateTime.now()
                                          .add(Duration(days: index))
                                          .weekday -
                                      1]
                                  .toString(),
                              style: TextStyles.bodySmall,
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          // model.updateDateSelectedIndex(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 12.w),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderStyles.normal,
                            color: Palette.whiteColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                //  model.listOfDates[index].toString(),
                                DateTime.now()
                                    .add(Duration(days: index))
                                    .day
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyles.titleLarge,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                CustomDateTime.listOfDays[DateTime.now()
                                            .add(Duration(days: index))
                                            .weekday -
                                        1]
                                    .toString(),
                                style: TextStyles.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Palette.blackColor,
          size: 20,
        ),
      ],
    );
  }

  Widget _showTimeCalerner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back_ios,
          color: Palette.blackColor,
          size: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3, //model.totalDays,
              // controller: model.scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return currentDateSelectedIndex == index
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        margin: EdgeInsets.only(right: 12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderStyles.normal,
                            color: Palette.whiteColor,
                            border: Border.all(
                              color: Palette.primaryColor,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "09:00 - 12:00",
                              textAlign: TextAlign.center,
                              style: TextStyles.titleLarge,
                            ),
                            SizedBox(height: 10.h),
                            const Text(
                              "Morning",
                              style: TextStyles.bodySmall,
                            ),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          // model.updateDateSelectedIndex(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 12.w),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderStyles.normal,
                            color: Palette.whiteColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "12:00 - 02:00",
                                textAlign: TextAlign.center,
                                style: TextStyles.titleLarge,
                              ),
                              SizedBox(height: 10.h),
                              const Text(
                                "Afternoon",
                                style: TextStyles.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Palette.blackColor,
          size: 20,
        ),
      ],
    );
  }

  showConfirmationBookingAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Palette.whiteColor,
          surfaceTintColor: Palette.whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 14),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h),
                child: const ClipOval(
                  child: Image(
                    image: AssetImage(confirmIcon),
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                "Thanks for your booking".tr,
                style: TextStyles.headlineLarge,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 32.w, right: 32.w),
                child: Text(
                  "Your booking was successful and you’ll receive a confirmation message shortly"
                      .tr,
                  style: TextStyles.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12.h, top: 24.h),
                child: Text(
                  "Your booking details".tr,
                  style: TextStyles.titleMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderStyles.normal,
                          color: Palette.bgTextFeildColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "09:00 - 12:00",
                              textAlign: TextAlign.center,
                              style: TextStyles.titleLarge,
                            ),
                            SizedBox(height: 10.h),
                            const Text(
                              "Morning",
                              style: TextStyles.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderStyles.normal,
                          color: Palette.bgTextFeildColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "12:00 - 02:00",
                              textAlign: TextAlign.center,
                              style: TextStyles.titleLarge,
                            ),
                            SizedBox(height: 10.h),
                            const Text(
                              "Afternoon",
                              style: TextStyles.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SubmitButton(
                        backGroundColor: Palette.whiteColor,
                        titleColor: Palette.primaryColor,
                        onTap: () {
                          setState(() {
                            isTrackingScreen = false;
                          });
                          Get.back();
                        },
                        title: "Back to home".tr,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: SubmitButton(
                        onTap: () {
                          setState(() {
                            isTrackingScreen = true;
                          });
                          Get.back();
                        },
                        title: "Tracking".tr,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) => {
          isTrackingScreen
              ? Get.off(() => const Tracking())
              : Get.offAll(() => const Dashboard()),
        });
  }
}
