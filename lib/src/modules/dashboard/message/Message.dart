// ignore_for_file: file_names

import 'package:flutter_slidable_panel/controllers/slide_controller.dart';
import 'package:flutter_slidable_panel/widgets/slidable_panel.dart';
import 'package:notary_ping/src/modules/dashboard/message/Chat.dart';

import '../../../../index.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  bool isslide = false;
  final SlideController _slideController = SlideController(
    usePreActionController: true,
    usePostActionController: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: CustomTextField(
              hintText: "Search".tr,
              prefixIcon: settingIcon,
            ),
          ),
          const CustomMessageItem(
            lastMessage:
                'No rush, mate! Just let...No rush, mate! Just let...No rush, mate! Just let...',
            userImgUrl: user,
            userName: 'Ruhel Chowdhury',
            isonline: true,
            isRead: false,
            isSender: false,
            time: '5:15 PM',
          ),
          const CustomMessageItem(
            lastMessage: 'No rush,  ',
            userImgUrl: user,
            userName: 'Ruhel Chowdhury',
            isonline: false,
            isRead: false,
            isSender: false,
            time: '5:15 PM',
          ),
          const CustomMessageItem(
            lastMessage:
                'No rush, mate! Just let...No rush, mate! Just let...No rush, mate! Just let...',
            userImgUrl: user,
            userName: 'Ruhel Chowdhury',
            isonline: true,
            isRead: true,
            isSender: false,
            time: '5:15 PM',
          ),
          const CustomMessageItem(
            lastMessage:
                'No rush, mate! Just let...No rush, mate! Just let...No rush, mate! Just let...',
            userImgUrl: user,
            userName: 'Ruhel Chowdhury',
            isonline: false,
            isRead: true,
            isSender: true,
            time: '5:15 PM',
          ),
          Container(
            color: isslide ? Palette.bgTextFeildColor : Palette.whiteColor,
            child: SlidablePanel(
              onSlideStart: () {
                setState(() {
                  isslide = true;
                });
              },
              controller: _slideController,
              maxSlideThreshold: 0.3,
              axis: Axis.horizontal,
              postActions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Palette.whiteColor,
                    child: Image.asset(
                      reportIcon,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Palette.whiteColor,
                    child: Image.asset(
                      deleteIcon,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ],
              child: CustomMessageItem(
                onTap: () => Get.to(() => const Chat()),
                lastMessage:
                    'No rush, mate! Just let...No rush, mate! Just let...No rush, mate! Just let...',
                userImgUrl: user,
                userName: 'Ruhel Chowdhury',
                isonline: false,
                isRead: true,
                isSender: true,
                time: '5:15 PM',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                            fit: BoxFit.fill,
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
