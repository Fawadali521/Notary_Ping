import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notary_ping/src/modules/dashboard/home/Home.dart';
import 'package:notary_ping/src/modules/dashboard/profile/Profile.dart';
import 'package:notary_ping/src/modules/dashboard/search/search.dart';

import '../../../styles.dart';
import 'chat/chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

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
        children: const [
          HomeScreen(),
          SearchScreen(),
          Chats(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
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
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageIcon(
                AssetImage(iconPath),
                size: 20,
                color:
                    currentIndex == index ? Palette.primaryColor : Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.5),
                child: Text(
                  label,
                  style: TextStyles.bottomBarText.copyWith(
                      color: currentIndex == index
                          ? Palette.primaryColor
                          : Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
