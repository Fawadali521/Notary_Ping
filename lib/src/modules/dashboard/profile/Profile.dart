   import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Duration upRowDelay = const Duration(milliseconds: 500);
  Duration listDelay = const Duration(milliseconds: 350);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration:   const BoxDecoration(
            gradient:
            LinearGradient(colors: [Palette.blue1, Palette.blue2])),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SafeArea(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedDisplay(
                    delay: upRowDelay,
                    slidingBeginOffset: const Offset(-1.0, 0.0),
                    slidingCurve: Curves.ease,
                    child: const Text(
                      "Profile",
                      style: TextStyles.bodyText,
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
                          onTap: () {

                          },
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
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
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      "assets/icons/qr.png",
                                      height: 20,
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
                            onTap: () {

                            },
                            child: Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                        "assets/icons/user-avatar-edit.png",
                                        height: 22,
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
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 102,
                        width: 102,
                        decoration: BoxDecoration(
                          color: Palette.primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Container(
                            height: 98,
                            width: 98,
                            decoration: BoxDecoration(
                              gradient:   LinearGradient(
                                  colors: [Palette.blue1, Palette.blue2]),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Container(
                                height: 96,
                                width: 96,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage("assets/image/me.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 7),
                        child: Opacity(
                          opacity: 0.9,
                          child: Text(
                            "Shivay Kumar",
                            style: TextStyles.buttonText,
                          ),
                        ),
                      ),
                      const Text(
                        "s_paradox",
                        style: TextStyles.buttonText,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$4856",
                        style: TextStyles.buttonText,
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Money In",
                              style: TextStyles.buttonText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                CupertinoIcons.arrow_down_left,
                                color: Colors.white,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$3475",
                        style: TextStyles.buttonText,
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Money Out",
                              style: TextStyles.buttonText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                CupertinoIcons.arrow_turn_right_up,
                                color: Colors.white,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "78",
                        style: TextStyles.buttonTextBlack,
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Contacts",
                              style: TextStyles.buttonTextBlack,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.people_alt_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 50),
                child: Column(
                  // shrinkWrap: true,
                  // padding: EdgeInsets.only(top: 20, bottom: 100),
                  children: [
                    profileItem(
                        icon: "assets/icons/padlock.png", title: "Security"),
                    profileItem(
                        icon: "assets/icons/group.png", title: "Contacts"),
                    profileItem(
                        icon: "assets/icons/operator.png", title: "Contact Us"),
                    profileItem(
                        icon: "assets/icons/terms-and-conditions.png",
                        title: "Terms & Conditions"),
                    profileItem(
                        icon: "assets/icons/privacy-policy.png",
                        title: "Privacy Policy"),
                    profileItem(
                        icon: "assets/icons/power-off.png", title: "Sign Out"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  profileItem({required String icon, required String title}) {
    double width = MediaQuery.of(context).size.width;
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
                  color: Palette.secondaryColor.withOpacity(0.05),
                ),
                child: Center(
                    child: Image.asset(
                      icon,
                      height: 25,
                      fit: BoxFit.contain,
                      color: Palette.secondaryColor,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  style: TextStyles.bodyText,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.black,
                  ))
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
