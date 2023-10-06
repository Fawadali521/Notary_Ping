import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notary_ping/src/modules/login/login_screen.dart';
import 'package:notary_ping/src/utility/common_button.dart';

import '../../../styles.dart';
import '../../model/content_model.dart';
// Asimkhan1122
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
   OnBoardingScreenState createState() =>  OnBoardingScreenState();
}

class  OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController?  controller;


  @override
  void initState() {
     controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
     controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.08,),
                      SvgPicture.asset(
                        contents[i].image!,
                        height: 300,
                      ),
                      SizedBox(height: height * 0.1,),

                      Text(
                        contents[i].title!,
                        style: TextStyles.boardingHeading
                      ),
                      SizedBox(height: height * 0.06,),
                      Text(
                        contents[i].discription!,
                        textAlign: TextAlign.center,
                        style: TextStyles.bodyBlack.copyWith(
                          color: Colors.black.withOpacity(0.4)
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButtonWidget(
              buttonText: currentIndex == contents.length - 1 ? "Continue" : "Next",
              onTap: (){
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                }
                controller?.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
            ),
            // child: FlatButton(
            //   child: Text(
            //       currentIndex == contents.length - 1 ? "Continue" : "Next"),
            //   onPressed: () {
                // if (currentIndex == contents.length - 1) {
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => LoginScreen(),
                //     ),
                //   );
                // }
                //  controller?.nextPage(
                //   duration: Duration(milliseconds: 100),
                //   curve: Curves.bounceIn,
                // );
              // },
            //   color: Theme.of(context).primaryColor,
            //   textColor: Colors.white,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            // ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}