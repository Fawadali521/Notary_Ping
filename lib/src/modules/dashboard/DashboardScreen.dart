
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/dashboard/home/Home.dart';
import 'package:notary_ping/src/modules/dashboard/messages/Messages.dart';
import 'package:notary_ping/src/modules/dashboard/profile/Profile.dart';
import 'package:notary_ping/src/modules/dashboard/search/search.dart';

import '../../../styles.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key,});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 3; // Set the initial index to 0
  late final PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));

    return Scaffold(
     // backgroundColor: Colors.transparent,
      //extendBody: true,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children:   const [
          HomeScreen(),
          SearchScreen(),
          MessagesScreen(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
        child: Container(
          height: 66,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, "Home", "assets/icon/home.png"),
              _buildNavItem(1, "Search", "assets/icon/search.png"),
              _buildNavItem(2, "Messages", "assets/icon/messages.png"),
              _buildNavItem(3, "Profile", "assets/icon/profile.png"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath) {
    return GestureDetector(
      onTap: () {
        currentIndex = index;
        pageController?.jumpToPage(index);
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          bottom: 5
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(
              AssetImage(iconPath),
              size: 20,
              color: currentIndex == index ? Palette.primaryColor : Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                label,
                style: TextStyles.bottomBarText.copyWith(
                  color: currentIndex == index ? Palette.primaryColor : Colors.grey
                ),


                // style: TextStyle(
                //   color: currentIndex == index ? Palette.primaryColor : Colors.grey,
                //   fontSize: 12,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   int currentIndex = 3;
//   late final PageController? pageController;
//   @override
//   void initState() {
//     pageController = PageController(
//       initialPage: currentIndex,
//     );
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     pageController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.light,
//     ));
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       extendBody: true,
//        body: PageView(
//         controller: pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         onPageChanged: (page) {
//           setState(() {
//             currentIndex = page;
//           });
//         },
//         children:    const [
//           HomeScreen(),
//           SearchScreen(),
//           MessagesScreen(),
//           Profile(),
//
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(right: 10 , left : 10 ,bottom: 20),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: BottomNavigationBar(
//             elevation: 1,
//             type: BottomNavigationBarType.fixed,
//              backgroundColor: Colors.black,
//             enableFeedback: false,
//             iconSize: 24,
//             selectedItemColor: Palette.primaryColor,
//             selectedLabelStyle: TextStyles.bottomBarText,
//             unselectedLabelStyle: TextStyles.bottomBarText,
//             unselectedItemColor: Colors.grey ,
//             currentIndex: currentIndex,
//             showSelectedLabels: true,
//             showUnselectedLabels: true,
//             onTap: (value) {
//               currentIndex = value;
//               pageController?.jumpToPage(
//                 value,
//                 // curve: Curves.decelerate,
//                 // duration: const Duration(milliseconds: 300),
//               );
//
//               setState(() {});
//             },
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10
//                   ),
//                   child: ImageIcon(
//                     AssetImage("assets/icon/home.png"),
//                     size: 20,
//                   ),
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10
//                   ),
//                   child: ImageIcon(AssetImage("assets/icon/search.png"), size: 20),
//                 ),
//                 label: 'Search',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10
//                   ),
//
//
//                   child: ImageIcon(AssetImage("assets/icon/messages.png"), size: 24),
//                 ),
//                 label: 'Messages',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(
//                     top: 20,
//                     bottom: 10
//                   ),
//                   child: ImageIcon(AssetImage("assets/icon/profile.png"), size: 20),
//                 ),
//                 label: 'Profile',
//               ),
//              ],
//           ),
//         ),
//       ),
//     );
//   }
// }
