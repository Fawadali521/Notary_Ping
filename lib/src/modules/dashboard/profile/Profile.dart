import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/dashboard/profile/Languages.dart';
import 'package:notary_ping/src/modules/dashboard/profile/TermAndCondition.dart';
import 'package:notary_ping/src/modules/dashboard/profile/setting.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Duration upRowDelay = const Duration(milliseconds: 500);
  Duration listDelay = const Duration(milliseconds: 200);
  Duration splashDelay = const Duration(milliseconds: 100);
  double scaleValue = 0.8;
  bool shouldAnimate = true;
  bool switchValue = true; // Initialize the switch state to false (off).

  @override
  void initState() {
    super.initState();
    // Start the animation when the widget is initialized
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(
        const Duration(seconds: 1)); // Delay the animation for 1 second
    setState(() {
      shouldAnimate = false; // Stop the initial animation
    });

    await Future.delayed(
        const Duration(seconds: 1)); // Delay for another 1 second
    setState(() {
      shouldAnimate = true; // Start the reverse animation
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            // color: Palette.primaryColor
            gradient: LinearGradient(
          colors: [Palette.secondaryColor, Palette.primaryColor],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SafeArea(child: SizedBox()),
            //profile
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedDisplay(
                    delay: upRowDelay,
                    slidingBeginOffset: const Offset(-1.0, 0.0),
                    slidingCurve: Curves.ease,
                    child: Text(
                      "Profile",
                      style: TextStyles().profileBold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DelayedDisplay(
                        delay: upRowDelay,
                        slidingBeginOffset: const Offset(1.0, 0.0),
                        slidingCurve: Curves.ease,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderStyles.norm2,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      "assets/icon/notification.png",
                                      height: 24,
                                      fit: BoxFit.contain,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: DelayedDisplay(
                          delay: upRowDelay,
                          slidingBeginOffset: const Offset(1.0, 0.0),
                          slidingCurve: Curves.ease,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1,
                                ),
                                color: Palette.primaryColor.withOpacity(0.05),
                              ),
                              child: Center(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Transform.scale(
                                        scale:
                                            0.6, // Adjust the scale factor as needed (0.8 scales it down to 80% of its original size)

                                        child: CupertinoSwitch(
                                          activeColor: Palette.secondaryColor,
                                          value: switchValue,
                                          onChanged: (newValue) {
                                            setState(() {
                                              switchValue =
                                                  newValue; // Update the switch state when it's toggled.
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //image
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Palette.primaryColor,
                        ),
                        child: Center(
                          child: AnimatedSize(
                              duration: const Duration(seconds: 2),
                              curve: Curves.bounceInOut,
                              child: shouldAnimate
                                  ? Transform.scale(
                                      scale: scaleValue,
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/profileImage.png"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profileImage.png"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          "Brookly Simmons",
                          style: TextStyles().profileWhite,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Image.asset(
                              'assets/icon/location.png',
                              color: Colors.white,
                              height: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Opacity(
                              opacity: 0.7,
                              child: Text(
                                "Lafate California 900001",
                                style: TextStyles().profileLocation,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            //list
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 80),
                child: ListView(
                  shrinkWrap: true,
                  // padding: EdgeInsets.only(top: 20, bottom: 100),
                  children: [
                    DelayedDisplay(
                      delay: upRowDelay,
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: ProfileItem(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: const Setting()));
                          },
                          icon: "assets/icon/setting.png",
                          title: "App Setting"),
                    ),
                    DelayedDisplay(
                      delay: upRowDelay + const Duration(milliseconds: 100),
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: const ProfileItem(
                          icon: "assets/icon/prize.png",
                          title: "My subscription"),
                    ),
                    DelayedDisplay(
                      delay: upRowDelay + const Duration(milliseconds: 200),
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: const ProfileItem(
                          icon: "assets/icon/edit.png", title: "Edit profile"),
                    ),
                    DelayedDisplay(
                      delay: upRowDelay + const Duration(milliseconds: 300),
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: const ProfileItem(
                          icon: "assets/icon/booking.png",
                          title: "Booking history"),
                    ),
                    DelayedDisplay(
                      delay: upRowDelay + const Duration(milliseconds: 400),
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: ProfileItem(
                        icon: "assets/icon/language.png",
                        title: "Languages",
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const Languages()));
                        },
                      ),
                    ),
                    DelayedDisplay(
                      delay: upRowDelay + const Duration(milliseconds: 500),
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: const ProfileItem(
                          icon: "assets/icon/customer-support.png",
                          title: "Customer support"),
                    ),
                    DelayedDisplay(
                      delay: upRowDelay + const Duration(milliseconds: 600),
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: ProfileItem(
                        icon: "assets/icon/terms-and-conditions.png",
                        title: "Terms and conditions",
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const TermAndCondition()));
                        },
                      ),
                    ),
                    DelayedDisplay(
                      delay: upRowDelay + const Duration(seconds: 700),
                      slidingBeginOffset: const Offset(-1.0, 0.0),
                      slidingCurve: Curves.ease,
                      child: const ProfileItem(
                          icon: "assets/icon/logout.png", title: "Log Out"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key? key, required this.icon, required this.title, this.onTap})
      : super(key: key);
  final String icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Palette.primaryColor.withOpacity(0.07),
                ),
                child: Center(
                    child: Image.asset(
                  icon,
                  height: 22,
                  fit: BoxFit.contain,
                  color: Palette.primaryColor,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  style: TextStyles().profileTileText,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Container(
              width: width,
              height: 1,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
          ),
        )
      ],
    );
  }
}
