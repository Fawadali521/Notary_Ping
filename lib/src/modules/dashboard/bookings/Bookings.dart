// ignore_for_file: file_names

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
                    icon: bookingsIcon,
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
                    return const CustomBookingItem(
                      imgUrl: user,
                      name: 'John Doe',
                      date: 'June 10,2023',
                      time: '10:30 AM',
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CustomBookingItem(
                      imgUrl: user,
                      name: 'John Doe',
                      date: 'June 10,2023',
                      time: '10:30 AM',
                      isHistory: true,
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

class CustomBookingItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String date;
  final String time;
  final bool isHistory;

  const CustomBookingItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.date,
    required this.time,
    this.isHistory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Palette.whiteColor,
        borderRadius: BorderStyles.normal,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(imgUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyles.titleMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            date,
                            style: TextStyles.bodySmall,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyles.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Palette.bgTextFeildColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Signature for property documents".tr,
                    style: TextStyles.bodyLarge.copyWith(
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          isHistory
              ? const SizedBox()
              : Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Palette.lightBlueColor.withOpacity(0.7),
                    borderRadius: BorderStyles.thin,
                  ),
                  child: Text(
                    "Tracking".tr,
                    style: TextStyles.bodyLarge.copyWith(
                      fontSize: 10,
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class CustomBookingButon extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSlected;
  final VoidCallback onTap;
  const CustomBookingButon({
    super.key,
    required this.title,
    required this.icon,
    required this.isSlected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: isSlected ? Palette.primaryColor : Palette.whiteColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16.sp,
              backgroundColor:
                  isSlected ? Palette.whiteColor : Palette.orangColor,
              child: Image.asset(
                bookingsIcon,
                height: 20.sp,
                color: isSlected ? Palette.primaryColor : Palette.whiteColor,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyles.titleMedium.copyWith(
                color: isSlected ? Palette.whiteColor : Palette.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
