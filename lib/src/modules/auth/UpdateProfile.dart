// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../utility/TextField.dart';
import '../../utility/common_button.dart';

//Asimkhan1122
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.blue2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              Center(
                child: Text(
                  'Add your account information',
                  style: TextStyles.heading1.copyWith(fontSize: 14),
                ),
              ),
              Stack(
                children: [
                  // Other widgets in the Stack
                  Container(
                    width: 90, // Adjust the size as needed
                    height: 90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius:
                              1, // Use responsive_sizer for spreadRadius
                          blurRadius: 1, // Use responsive_sizer for blurRadius
                          offset: const Offset(0, 1),
                        ),
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange, // Border color
                        width: 4, // Border width
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 60, // Adjust the radius as needed
                      backgroundColor:
                          Colors.white, // Background color of the circle
                      backgroundImage: AssetImage(
                          'assets/logo/icon.png'), // Profile picture image
                    ),
                  ),

                  Positioned(
                    top: 4, // Adjust the top position as needed
                    right: 6, // Adjust the right position as needed
                    child: InkWell(
                      onTap: () {
                        // Handle the camera icon tap event
                      },
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.orange, // Icon color
                        size: 18, // Icon size
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'Contact Information',
                style: TextStyles.heading1,
              ),

              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'Organaization ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),

              const Text(
                'Address  ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),

              const Text(
                'Address  ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const CommonTextField(
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'City ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'State ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Zip ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Work place ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(),

              //
              const Text(
                'personal  Information',
                style: TextStyles.heading1,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                'First Name  ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),

              const Text(
                'Registration Date  ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const CommonTextField(
                suffixIcon: Icon(Icons.calendar_month),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'City ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'State ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Email ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Password ',
                style: TextStyles.bodyText,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const CommonTextField(),
              SizedBox(
                height: height * 0.02,
              ),

              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const ElevatedButtonWidget(
                buttonText: 'Continues',
                buttonColor: Colors.orange,
              ),
              SizedBox(
                height: height * 0.02,
              ),

              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
