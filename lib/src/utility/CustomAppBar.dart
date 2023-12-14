// ignore_for_file: file_names, non_constant_identifier_names

import '../../index.dart';

PreferredSize CustomAppBar(
    {required String title, bool? isBack, bool? isNotification, Color? color}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      backgroundColor: color ?? Palette.bgColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyles.headlineLarge,
      ),
      elevation: 0,
      leading: isBack == true
          ? InkWell(
              onTap: () => Get.back(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Palette.blackColor,
                  size: 16,
                ),
              ),
            )
          : null,
      actions: [
        isNotification == true
            ? GestureDetector(
                // onTap: () => Get.to(() => const Notification()),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Stack(
                    children: [
                      Image.asset(
                        bellIcon,
                        color: Palette.blackColor,
                        height: 24,
                        width: 24,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        right: 0,
                        top: 2,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: Palette.primaryColor,
                          child: Text(
                            "5",
                            style: TextStyles.bodyLarge.copyWith(
                              color: Palette.whiteColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}
