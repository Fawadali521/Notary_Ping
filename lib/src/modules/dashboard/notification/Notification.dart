 import 'package:flutter/material.dart';

import '../../../../styles.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Palette.primaryColor.withOpacity(0.7),
        title: Text('Notification', style: TextStyles().appBarTitleWhite),
      ),
      body: ListView(
        children: const [
          NotificationTile(
            heading: "New Update Available!",
          ),
          NotificationTile(
            heading: "New Update Available!",
            subHeading: "Version 2.0.1",
          ),
          NotificationTile(
            heading: "New Update Available!",
            subHeading: "Version 2.0.1",
            description:
            "We've made some improvements and fixed some bugs. Update now for the best experience.",
          ),
          NotificationTile(
            heading: "Summer Sale!",
            subHeading: "Up to 50% off",
            description:
            "Check out our summer collection and get up to 50% off on select items.",
            banner: AssetImage("assets/images/profileImage.png"),
          ),
          NotificationTile(
            heading: "New Follower",
            subHeading: "John Doe started following you.",
            icon: AssetImage("assets/shop-icon/1.png"),
          ),
          NotificationTile(
            heading: "Event Reminder",
            subHeading: "Music Fest 2023",
            description:
            "Don't forget! The Music Fest 2023 starts tomorrow at 6 PM. Make sure to have your tickets ready.",
            icon: AssetImage("assets/shop-icon/1.png"),
            banner: AssetImage("assets/dummy-image/1.png"),
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String? heading;
  final String? subHeading;
  final String? description;
  final ImageProvider? icon; // Changed from IconData to ImageProvider
  final ImageProvider? banner;

  const NotificationTile({
    Key? key,
    this.heading,
    this.subHeading,
    this.description,
    this.icon,
    this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: Palette.blue2, // Adjust this color to suit your design
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: icon!,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                if (heading != null)
                  SizedBox(
                      width: width - 40 - 30 - 10 - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(heading!, style: TextStyles().appBarTitleWhite),
                          if (subHeading != null)
                            Text(subHeading!,
                                style: TextStyles().appBarTitleWhite),
                        ],
                      )),
              ],
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(description!, style: TextStyles.normalHeading),
              ),
            if (banner != null)
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                      width: width - 20,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: banner!,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ))),
          ],
        ),
      ),
    );
  }
}
