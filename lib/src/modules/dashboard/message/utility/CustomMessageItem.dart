// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomMessageItem extends StatelessWidget {
  final String lastMessage;
  final String userImgUrl;
  final String userName;
  final String time;
  final bool isonline;
  final bool isRead;
  final bool isSender;
  final VoidCallback? onTap;
  const CustomMessageItem({
    super.key,
    required this.lastMessage,
    required this.userImgUrl,
    required this.userName,
    required this.isonline,
    required this.isRead,
    required this.isSender,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 60,
                width: 60,
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            userImgUrl,
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      isonline
                          ? const Positioned(
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Palette.whiteColor,
                                radius: 8,
                                child: CircleAvatar(
                                  backgroundColor: Palette.greenColor,
                                  radius: 6,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 32.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            userName,
                            style: TextStyles.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            lastMessage,
                            style: TextStyles.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
              ),
            ),
            isSender
                ? const CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.transparent,
                  )
                : isRead
                    ? CircleAvatar(
                        radius: 8,
                        backgroundImage: AssetImage(userImgUrl),
                      )
                    : CircleAvatar(
                        radius: 8,
                        backgroundColor: Palette.bgTextFeildColor,
                        child: Icon(
                          Icons.check,
                          size: 10,
                          color: Palette.blackColor.withOpacity(0.7),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
