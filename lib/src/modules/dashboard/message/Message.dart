// ignore_for_file: file_names

import 'package:flutter_slidable_panel/widgets/slidable_panel.dart';
import 'package:notary_ping/src/modules/dashboard/message/Chat.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/CustomMessageItem.dart';
import 'package:notary_ping/src/states/message/MessageController.dart';

import '../../../../index.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  int isSelect = -1;

  final MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    user,
                    fit: BoxFit.cover,
                    height: 36,
                    width: 36,
                  ),
                ),
                const SizedBox(width: 9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hello".tr,
                      style: TextStyles.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Fawad Khan".tr,
                      style: TextStyles.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: CustomTextField(
              hintText: "Search".tr,
              prefixIcon: searchIcon,
              prefixIconColor: Palette.greyTextColor,
              borderRadius: BorderStyles.searchTextField,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.state.profiles.length,
            itemBuilder: (context, index) {
              return Container(
                color: isSelect == index
                    ? Palette.bgTextFeildColor
                    : Palette.whiteColor,
                child: SlidablePanel(
                  onSlideStart: () {
                    setState(() {
                      isSelect = index;
                    });
                  },
                  controller: controller.state.slideController[index],
                  maxSlideThreshold: 0.3,
                  axis: Axis.horizontal,
                  postActions: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 5.w),
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
                      padding: EdgeInsets.only(left: 5.w, right: 12.w),
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
                    onTap: () {
                      setState(() {
                        isSelect = index;
                      });
                      Get.to(() => const Chat());
                    },
                    lastMessage: controller.state.profiles[index].message!,
                    userImgUrl: controller.state.profiles[index].imgUrl!,
                    userName: controller.state.profiles[index].name!,
                    isonline: controller.state.profiles[index].isOnline!,
                    isRead: controller.state.profiles[index].isRead!,
                    isSender: controller.state.profiles[index].isSender!,
                    time: controller.state.profiles[index].time!,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
