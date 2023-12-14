// ignore_for_file: file_names
// // ignore_for_file: file_names

// import 'package:delayed_display/delayed_display.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:notary_ping/src/modules/dashboard/notification/Notification.dart';
// import 'package:notary_ping/src/modules/dashboard/profile/Languages.dart';
// import 'package:notary_ping/src/modules/dashboard/profile/TermAndCondition.dart';
// import 'package:notary_ping/src/modules/dashboard/setting/setting.dart';
// import 'package:page_transition/page_transition.dart';

// import '../../../../index.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> with TickerProviderStateMixin {
//   Duration upRowDelay = const Duration(milliseconds: 500);
//   Duration listDelay = const Duration(milliseconds: 200);
//   Duration splashDelay = const Duration(milliseconds: 100);
//   double scaleValue = 0.8;
//   bool shouldAnimate = true;
//   bool switchValue = true;
//   late AnimationController _controller;
//   late Animation<double> scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     loadingImageScale();
//   }

//   loadingImageScale() {
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );
//     scaleAnimation = Tween<double>(begin: 1, end: 1.3).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
//     )..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _controller.reverse();
//         }
//       });
//     _controller.forward();
//   }

//   // void _startScaleAnimation() {
//   //   _controller.forward();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: height / 2.5,
//                 width: width,
//                 decoration: const BoxDecoration(
//                     // color: Palette.primaryColor
//                     gradient: LinearGradient(
//                   colors: [Palette.secondaryColor, Palette.primaryColor],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 )),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Column(
//                     children: [
//                       //Upper row
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 20,
//                           right: 20,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             DelayedDisplay(
//                               delay: upRowDelay,
//                               slidingBeginOffset: const Offset(-1.0, 0.0),
//                               slidingCurve: Curves.ease,
//                               child: Text(
//                                 "Profile",
//                                 style: TextStyles().profileBold,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 DelayedDisplay(
//                                   delay: upRowDelay,
//                                   slidingBeginOffset: const Offset(1.0, 0.0),
//                                   slidingCurve: Curves.ease,
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           PageTransition(
//                                               type: PageTransitionType.fade,
//                                               child: const Notifications()));
//                                     },
//                                     child: Container(
//                                       height: 42,
//                                       width: 42,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderStyles.medium,
//                                         border: Border.all(
//                                           color: Colors.white.withOpacity(0.5),
//                                           width: 1,
//                                         ),
//                                         color: Colors.transparent,
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Image.asset(
//                                           "assets/icon/notification.png",
//                                           height: 24,
//                                           fit: BoxFit.contain,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 15),
//                                   child: DelayedDisplay(
//                                     delay: upRowDelay,
//                                     slidingBeginOffset: const Offset(1.0, 0.0),
//                                     slidingCurve: Curves.ease,
//                                     child: InkWell(
//                                       onTap: () {},
//                                       child: Container(
//                                         height: 42,
//                                         width: 42,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           border: Border.all(
//                                             color:
//                                                 Colors.white.withOpacity(0.5),
//                                             width: 1,
//                                           ),
//                                           color: Palette.primaryColor
//                                               .withOpacity(0.05),
//                                         ),
//                                         child: Center(
//                                           child: Stack(
//                                             clipBehavior: Clip.none,
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         horizontal: 10,
//                                                         vertical: 15),
//                                                 child: Transform.scale(
//                                                   scale:
//                                                       0.6, // Adjust the scale factor as needed (0.8 scales it down to 80% of its original size)

//                                                   child: CupertinoSwitch(
//                                                     activeColor:
//                                                         Palette.secondaryColor,
//                                                     trackColor:
//                                                         Colors.grey[300],
//                                                     value: switchValue,
//                                                     onChanged: (newValue) {
//                                                       setState(() {
//                                                         switchValue =
//                                                             newValue; // Update the switch state when it's toggled.
//                                                       });
//                                                     },
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 20, right: 20, bottom: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 const Center(
//                                   child: CircleAvatar(
//                                     radius: 52,
//                                     backgroundColor: Colors.white,
//                                     child: CircleAvatar(
//                                       radius: 50, // Adjust the radius as needed
//                                       backgroundImage: AssetImage(
//                                           'assets/images/profileImage.png'), // Replace with your image
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(top: 10, bottom: 5),
//                                   child: Text(
//                                     "Brookly Simmons",
//                                     style: TextStyles().profileWhite,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(bottom: 3),
//                                       child: Image.asset(
//                                         'assets/icon/location.png',
//                                         color: Colors.white,
//                                         height: 18,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 5),
//                                       child: Opacity(
//                                         opacity: 0.7,
//                                         child: Text(
//                                           "Lafate California 900001",
//                                           style: TextStyles().profileLocation,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )),
//           Positioned(
//               top: height * 0.3,
//               child: Container(
//                 height: height * 0.6,
//                 width: width,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(12),
//                         topLeft: Radius.circular(12))),
//                 child: ListView(
//                   shrinkWrap: true,
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                   ),
//                   children: [
//                     DelayedDisplay(
//                       delay: upRowDelay,
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: ProfileItem(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 PageTransition(
//                                     type: PageTransitionType.fade,
//                                     child: const Setting()));
//                           },
//                           icon: "assets/icon/setting.png",
//                           title: "App Setting"),
//                     ),
//                     DelayedDisplay(
//                       delay: upRowDelay + const Duration(milliseconds: 100),
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: const ProfileItem(
//                           icon: "assets/icon/prize.png",
//                           title: "My subscription"),
//                     ),
//                     DelayedDisplay(
//                       delay: upRowDelay + const Duration(milliseconds: 200),
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: const ProfileItem(
//                           icon: "assets/icon/edit.png", title: "Edit profile"),
//                     ),
//                     DelayedDisplay(
//                       delay: upRowDelay + const Duration(milliseconds: 300),
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: const ProfileItem(
//                           icon: "assets/icon/booking.png",
//                           title: "Booking history"),
//                     ),
//                     DelayedDisplay(
//                       delay: upRowDelay + const Duration(milliseconds: 400),
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: ProfileItem(
//                         icon: "assets/icon/language.png",
//                         title: "Languages",
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               PageTransition(
//                                   type: PageTransitionType.fade,
//                                   child: const Languages()));
//                         },
//                       ),
//                     ),
//                     DelayedDisplay(
//                       delay: upRowDelay + const Duration(milliseconds: 500),
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: const ProfileItem(
//                           icon: "assets/icon/customer-support.png",
//                           title: "Customer support"),
//                     ),
//                     DelayedDisplay(
//                       delay: upRowDelay + const Duration(milliseconds: 600),
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: ProfileItem(
//                         icon: "assets/icon/terms-and-conditions.png",
//                         title: "Terms and conditions",
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               PageTransition(
//                                   type: PageTransitionType.fade,
//                                   child: const TermAndCondition()));
//                         },
//                       ),
//                     ),
//                     DelayedDisplay(
//                       delay: upRowDelay + const Duration(seconds: 700),
//                       slidingBeginOffset: const Offset(-1.0, 0.0),
//                       slidingCurve: Curves.ease,
//                       child: const ProfileItem(
//                           icon: "assets/icon/logout.png", title: "Log Out"),
//                     ),
//                   ],
//                 ),
//               )),
//         ],
//       ),
//       // body: Container(
//       //   height: height,
//       //   width: width,
//       //   decoration: const BoxDecoration(
//       //       // color: Palette.primaryColor
//       //       gradient: LinearGradient(
//       //     colors: [Palette.secondaryColor, Palette.primaryColor],
//       //     begin: Alignment.bottomCenter,
//       //     end: Alignment.topCenter,
//       //   )
//       //   ),
//       //   child: ListView(
//       //     physics: const NeverScrollableScrollPhysics(),
//       //     shrinkWrap: true,
//       //     padding: const EdgeInsets.only(top: 20),
//       //     children: [
//       //       const SafeArea(child: SizedBox()),
//       //       //Upper row
//       //       Padding(
//       //         padding: const EdgeInsets.only(
//       //           left: 20,
//       //           right: 20,
//       //         ),
//       //         child: Row(
//       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //           crossAxisAlignment: CrossAxisAlignment.start,
//       //           children: [
//       //             DelayedDisplay(
//       //               delay: upRowDelay,
//       //               slidingBeginOffset: const Offset(-1.0, 0.0),
//       //               slidingCurve: Curves.ease,
//       //               child: Text(
//       //                 "Profile",
//       //                 style: TextStyles().profileBold,
//       //               ),
//       //             ),
//       //             Row(
//       //               mainAxisAlignment: MainAxisAlignment.end,
//       //               children: [
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay,
//       //                   slidingBeginOffset: const Offset(1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: GestureDetector(
//       //                     onTap: () {
//       //                       _startScaleAnimation();
//       //                       Navigator.push(
//       //                           context,
//       //                           PageTransition(
//       //                               type: PageTransitionType.fade,
//       //                               child: const Notifications()));
//       //
//       //                       // Call this function when the container is tapped
//       //                     },
//       //                     child: Container(
//       //                       height: 42,
//       //                       width: 42,
//       //                       decoration: BoxDecoration(
//       //                         borderRadius: BorderStyles.norm2,
//       //                         border: Border.all(
//       //                           color: Colors.white.withOpacity(0.5),
//       //                           width: 1,
//       //                         ),
//       //                         color: Colors.transparent,
//       //                       ),
//       //                       child: Padding(
//       //                         padding: const EdgeInsets.all(8.0),
//       //                         child: Image.asset(
//       //                           "assets/icon/notification.png",
//       //                           height: 24,
//       //                           fit: BoxFit.contain,
//       //                           color: Colors.white,
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ),
//       //                 ),
//       //                 Padding(
//       //                   padding: const EdgeInsets.only(left: 15),
//       //                   child: DelayedDisplay(
//       //                     delay: upRowDelay,
//       //                     slidingBeginOffset: const Offset(1.0, 0.0),
//       //                     slidingCurve: Curves.ease,
//       //                     child: InkWell(
//       //                       onTap: () {},
//       //                       child: Container(
//       //                         height: 42,
//       //                         width: 42,
//       //                         decoration: BoxDecoration(
//       //                           borderRadius: BorderRadius.circular(15),
//       //                           border: Border.all(
//       //                             color: Colors.white.withOpacity(0.5),
//       //                             width: 1,
//       //                           ),
//       //                           color: Palette.primaryColor.withOpacity(0.05),
//       //                         ),
//       //                         child: Center(
//       //                           child: Stack(
//       //                             clipBehavior: Clip.none,
//       //                             children: [
//       //                               Padding(
//       //                                 padding: const EdgeInsets.symmetric(
//       //                                     horizontal: 10, vertical: 15),
//       //                                 child: Transform.scale(
//       //                                   scale:
//       //                                       0.6, // Adjust the scale factor as needed (0.8 scales it down to 80% of its original size)
//       //
//       //                                   child: CupertinoSwitch(
//       //                                     activeColor: Palette.secondaryColor,
//       //                                     trackColor: Colors.grey[300],
//       //                                     value: switchValue,
//       //                                     onChanged: (newValue) {
//       //                                       setState(() {
//       //                                         switchValue =
//       //                                             newValue; // Update the switch state when it's toggled.
//       //                                       });
//       //                                     },
//       //                                   ),
//       //                                 ),
//       //                               ),
//       //                             ],
//       //                           ),
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ),
//       //                 ),
//       //               ],
//       //             )
//       //           ],
//       //         ),
//       //       ),
//       //       // profile image
//       //       Padding(
//       //         padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//       //         child: Row(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           children: [
//       //             Column(
//       //               children: [
//       //                 Center(
//       //                   child: ScaleTransition(
//       //                     scale: _scaleAnimation,
//       //                     child: const CircleAvatar(
//       //                       radius: 50, // Adjust the radius as needed
//       //                       backgroundImage: AssetImage(
//       //                           'assets/images/profileImage.png'), // Replace with your image
//       //                     ),
//       //                   ),
//       //                 ),
//       //                 Padding(
//       //                   padding: const EdgeInsets.only(top: 10, bottom: 5),
//       //                   child: Text(
//       //                     "Brookly Simmons",
//       //                     style: TextStyles().profileWhite,
//       //                   ),
//       //                 ),
//       //                 Row(
//       //                   children: [
//       //                     Padding(
//       //                       padding: const EdgeInsets.only(bottom: 3),
//       //                       child: Image.asset(
//       //                         'assets/icon/location.png',
//       //                         color: Colors.white,
//       //                         height: 18,
//       //                       ),
//       //                     ),
//       //                     Padding(
//       //                       padding: const EdgeInsets.only(left: 5),
//       //                       child: Opacity(
//       //                         opacity: 0.7,
//       //                         child: Text(
//       //                           "Lafate California 900001",
//       //                           style: TextStyles().profileLocation,
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ],
//       //                 ),
//       //               ],
//       //             )
//       //           ],
//       //         ),
//       //       ),
//       //       //list
//       //       Container(
//       //         decoration: const BoxDecoration(
//       //           color: Colors.white,
//       //           borderRadius: BorderRadius.only(
//       //             topLeft: Radius.circular(25),
//       //             topRight: Radius.circular(25),
//       //           ),
//       //         ),
//       //         child: Padding(
//       //           padding: const EdgeInsets.only(top: 20, bottom: 100),
//       //           child: MediaQuery.removePadding(
//       //             context: context,
//       //             removeTop: true,
//       //             child: ListView(
//       //               shrinkWrap: true,
//       //               physics: const NeverScrollableScrollPhysics(),
//       //               //padding: EdgeInsets.only(top: 20, bottom: 100),
//       //               children: [
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay,
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: ProfileItem(
//       //                       onTap: () {
//       //                         Navigator.push(
//       //                             context,
//       //                             PageTransition(
//       //                                 type: PageTransitionType.fade,
//       //                                 child: const Setting()));
//       //                       },
//       //                       icon: "assets/icon/setting.png",
//       //                       title: "App Setting"),
//       //                 ),
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay + const Duration(milliseconds: 100),
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: const ProfileItem(
//       //                       icon: "assets/icon/prize.png",
//       //                       title: "My subscription"),
//       //                 ),
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay + const Duration(milliseconds: 200),
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: const ProfileItem(
//       //                       icon: "assets/icon/edit.png",
//       //                       title: "Edit profile"),
//       //                 ),
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay + const Duration(milliseconds: 300),
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: const ProfileItem(
//       //                       icon: "assets/icon/booking.png",
//       //                       title: "Booking history"),
//       //                 ),
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay + const Duration(milliseconds: 400),
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: ProfileItem(
//       //                     icon: "assets/icon/language.png",
//       //                     title: "Languages",
//       //                     onTap: () {
//       //                       Navigator.push(
//       //                           context,
//       //                           PageTransition(
//       //                               type: PageTransitionType.fade,
//       //                               child: const Languages()));
//       //                     },
//       //                   ),
//       //                 ),
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay + const Duration(milliseconds: 500),
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: const ProfileItem(
//       //                       icon: "assets/icon/customer-support.png",
//       //                       title: "Customer support"),
//       //                 ),
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay + const Duration(milliseconds: 600),
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: ProfileItem(
//       //                     icon: "assets/icon/terms-and-conditions.png",
//       //                     title: "Terms and conditions",
//       //                     onTap: () {
//       //                       Navigator.push(
//       //                           context,
//       //                           PageTransition(
//       //                               type: PageTransitionType.fade,
//       //                               child: const TermAndCondition()));
//       //                     },
//       //                   ),
//       //                 ),
//       //                 DelayedDisplay(
//       //                   delay: upRowDelay + const Duration(seconds: 700),
//       //                   slidingBeginOffset: const Offset(-1.0, 0.0),
//       //                   slidingCurve: Curves.ease,
//       //                   child: const ProfileItem(
//       //                       icon: "assets/icon/logout.png", title: "Log Out"),
//       //                 ),
//       //               ],
//       //             ),
//       //           ),
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),Log
//     );
//   }
// }

// class ProfileItem extends StatelessWidget {
//   const ProfileItem(
//       {Key? key, required this.icon, required this.title, this.onTap})
//       : super(key: key);
//   final String icon;
//   final String title;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//           child: Row(
//             children: [
//               Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Palette.primaryColor.withOpacity(0.07),
//                 ),
//                 child: Center(
//                     child: Image.asset(
//                   icon,
//                   height: 22,
//                   fit: BoxFit.contain,
//                   color: Palette.primaryColor,
//                 )),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Text(
//                   title,
//                   style: TextStyles().profileTileText,
//                 ),
//               ),
//               const Spacer(),
//               IconButton(
//                 onPressed: onTap,
//                 icon: Image.asset(
//                   'assets/icon/right-arrow.png',
//                   height: 18,
//                   width: 18,
//                 ),
//               )
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 10,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 70),
//             child: Container(
//               width: width,
//               height: 1,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.05),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
