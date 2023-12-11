// ignore_for_file: file_names

import '../../../../index.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteColor,
        appBar: AppBar(
          backgroundColor: Palette.whiteColor,
          surfaceTintColor: Colors.transparent,
          elevation: 4,
          shadowColor: Palette.greyTextColor.withOpacity(0.2),
          centerTitle: false,
          leadingWidth: 36.sp,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 12.w),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Palette.blackColor,
                size: 20.sp,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Icon(
                Icons.more_vert,
                color: Palette.primaryColor,
                size: 24.sp,
              ),
            ),
          ],
          title: Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              user,
                              fit: BoxFit.fill,
                              height: 60,
                              width: 60,
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Palette.whiteColor,
                            radius: 6,
                            child: CircleAvatar(
                              backgroundColor: Palette.greenColor,
                              radius: 5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Fawad",
                      style: TextStyles.titleSmall,
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Active now", // isTyping ? "typing..." : "online",
                        style: TextStyles.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Palette.secondaryColor, Palette.primaryColor],
          //       end: Alignment.centerRight,
          //       begin: Alignment.centerLeft,
          //     ),
          //   ),
          // ),
        ),
        body: Column(
          children: [
            Container(),
          ],
        ));
  }
}
