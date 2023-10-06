import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../utility/common_button.dart';
import '../../utility/text_field.dart';

//Asimkhan1122
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return   Scaffold(
      backgroundColor: Palette.blue2,


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.08,),
              Center(
                child: Text('Add your account information',
                  style: TextStyles.boardingHeading.copyWith(fontSize: 14),),
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
                          spreadRadius: 1, // Use responsive_sizer for spreadRadius
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
                    child:  CircleAvatar(
                      radius: 60, // Adjust the radius as needed
                      backgroundColor: Colors.white, // Background color of the circle
                      backgroundImage: AssetImage('assets/logo/icon.png'), // Profile picture image
                    ),
                  ),

                  Positioned(
                    top: 4, // Adjust the top position as needed
                    right: 6, // Adjust the right position as needed
                    child: InkWell(
                      onTap: () {
                        // Handle the camera icon tap event
                      },
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.orange, // Icon color
                        size: 18, // Icon size
                      ),
                    ),
                  ),

                ],
              ),


              SizedBox(height: height * 0.04,),
              Text('Contact Information',style: TextStyles.boardingHeading,),


              SizedBox(height: height * 0.04,),
              Text('Organaization ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),

              Text('Address  ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),
              const TextFieldWidget(
               ),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),

              Text('Address  ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),
              const TextFieldWidget(
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(height: height * 0.02,),
              Text('City ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              Text('State ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              Text('Zip ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              const Text('Work place ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),

              //
              Text('personal  Information',style: TextStyles.boardingHeading,),
              SizedBox(height: height * 0.04,),
              Text('First Name  ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),

              Text('Registration Date  ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.02,),
              const TextFieldWidget(
                suffixIcon: Icon(Icons.calendar_month),
              ),
              SizedBox(height: height * 0.02,),
              Text('City ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              Text('State ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              Text('Email ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
              const Text('Password ',style: TextStyles.bodyBlack,),
              SizedBox(height: height * 0.01,),
              const TextFieldWidget(),
              SizedBox(height: height * 0.02,),

              SizedBox(height: height * 0.02,),
              SizedBox(height: height * 0.02,),
               SizedBox(height: height * 0.02,),
              ElevatedButtonWidget(buttonText: 'Continues', buttonColor: Colors.orange,),
              SizedBox(height: height * 0.02,),


              SizedBox(height: height * 0.02,),













            ],
          ),
        ),
      ),
    );
  }
}
