// ignore_for_file: file_names

import 'package:notary_ping/src/modules/dashboard/bookings/Tracking.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/CustomBookingButon.dart';
import 'package:notary_ping/src/modules/dashboard/bookings/utility/CustomBookingItem.dart';

import '../../../../index.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int currentIndex = 0;
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
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        title: 'Booking'.tr,
        isNotification: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomBookingButon(
                    onTap: () {
                      currentIndex = 0;
                      pageController?.jumpToPage(0);
                      setState(() {});
                    },
                    title: 'Currents booking'.tr,
                    icon: bookingsIcon,
                    isSlected: currentIndex == 0 ? true : false,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  flex: 2,
                  child: CustomBookingButon(
                    onTap: () {
                      currentIndex = 1;
                      pageController?.jumpToPage(1);
                      setState(() {});
                    },
                    title: 'History'.tr,
                    icon: historyIcon,
                    isSlected: currentIndex == 1 ? true : false,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: [
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CustomBookingItem(
                      imgUrl: user,
                      name: 'John Doe',
                      date: 'June 10,2023',
                      time: '10:30 AM',
                      onTap: () => Get.to(() => const Tracking()),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CustomBookingItem(
                      imgUrl: user,
                      name: 'John Doe',
                      date: 'June 10,2023',
                      time: '10:30 AM',
                      isHistory: true,
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
          //
          // SizedBox(height: 20.h),
          // const CustomBookingItem(
          //   imgUrl: user,
          //   name: 'John Doe',
          //   date: 'June 10,2023',
          //   time: '10:30 AM',
          // ),
        ],
      ),
    );
  }
}
