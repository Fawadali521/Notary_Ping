// ignore_for_file: file_names

import 'package:notary_ping/src/modules/dashboard/chat/chart.dart';
import 'package:notary_ping/src/modules/dashboard/home/Home.dart';
import 'package:notary_ping/src/modules/dashboard/profile/Profile.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/Bookings.dart';

import '../../../index.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 1;
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
    return Scaffold(
      extendBody: true,
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
          Bookings(),
          Chats(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Palette.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(0, "Home", homeIcon),
            _buildNavItem(1, "Bookings", bookingsIcon),
            _buildNavItem(2, "Message", messageIcon),
            _buildNavItem(3, "Profile", userIcon),
          ],
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageIcon(
            AssetImage(iconPath),
            size: 24,
            color: currentIndex == index
                ? Palette.primaryColor
                : Palette.greyTextColor,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              label.tr,
              style: TextStyles.bodySmall.copyWith(
                color: currentIndex == index
                    ? Palette.primaryColor
                    : Palette.greyTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
