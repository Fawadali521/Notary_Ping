// ignore_for_file: file_names

import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/AudioMessage.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/MessageBar.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/TextMessage.dart';
import 'package:notary_ping/src/states/message/MessageController.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../index.dart';
import '../../../constant/time_formate.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final MessageController controller = Get.put(MessageController());

  late final RecorderController recorderController;

  String? path;
  String? musicFile;

  bool isRecordingCompleted = false;
  bool isLoading = true;
  late Directory appDirectory;
  final ScrollController _scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    _getDir();
    _initialiseControllers();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        moveUpper();
      }
    });
  }

  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory.path}/recording.m4a";
    isLoading = false;
    setState(() {});
  }

  void _initialiseControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }

  moveUpper() async {
    await Future.delayed(const Duration(milliseconds: 500), () {});
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: _chatAppBar(),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 1,
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                Future.delayed(const Duration(milliseconds: 100), () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              user,
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextMessage(
                                    text:
                                        'bubble noal with normal with with tail',
                                    isSender: false,
                                    tail: true,
                                    textStyle: TextStyles.bodyMedium.copyWith(
                                      color: Palette.blackColor,
                                    ),
                                    timeStyle: TextStyles.bodySmall,
                                    // time: onlyTime.format(now),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 72),
                      child: TextMessage(
                        text: 'bubble noal with normal with with tail',
                        isSender: false,
                        tail: true,
                        textStyle: TextStyles.bodyMedium.copyWith(
                          color: Palette.blackColor,
                        ),
                        timeStyle: TextStyles.bodySmall,
                        // time: onlyTime.format(now),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 72),
                      child: TextMessage(
                        text: 'bubble noal',
                        isSender: false,
                        tail: true,
                        textStyle: TextStyles.bodyMedium.copyWith(
                          color: Palette.blackColor,
                        ),
                        timeStyle: TextStyles.bodySmall,
                        time: onlyTime.format(now),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: TextMessage(
                        text:
                            'bubble normal with normal with normal with normal with normal with tail',
                        isSender: true,
                        tail: true,
                        time: onlyTime.format(now),
                        timeStyle: TextStyles.bodySmall,
                        textStyle: TextStyles.bodyMedium.copyWith(
                          color: Palette.whiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              user,
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextMessage(
                                    text:
                                        'bubble normal with normal with normal with normal with normal with tail',
                                    isSender: false,
                                    tail: true,
                                    time: onlyTime.format(now),
                                    timeStyle: TextStyles.bodySmall,
                                    textStyle: TextStyles.bodyMedium.copyWith(
                                      color: Palette.blackColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: TextMessage(
                        text:
                            'bubble normal with normal with normal with normal with normal with tail',
                        isSender: true,
                        tail: true,
                        time: onlyTime.format(now),
                        timeStyle: TextStyles.bodySmall,
                        textStyle: TextStyles.bodyMedium.copyWith(
                          color: Palette.whiteColor,
                        ),
                      ),
                    ),
                    TextMessage(
                      text: 'bubble normal with normalh normal with tail',
                      isSender: true,
                      tail: true,
                      textStyle: TextStyles.bodyMedium.copyWith(
                        color: Palette.whiteColor,
                      ),
                    ),
                    TextMessage(
                      text: 'bubble normal with nor',
                      isSender: true,
                      tail: true,
                      textStyle: TextStyles.bodyMedium.copyWith(
                        color: Palette.whiteColor,
                      ),
                    ),
                    TextMessage(
                      text: ' with tail',
                      isSender: true,
                      tail: true,
                      time: onlyTime.format(now),
                      timeStyle: TextStyles.bodySmall,
                      textStyle: TextStyles.bodyMedium.copyWith(
                        color: Palette.whiteColor,
                      ),
                    ),
                    if (isRecordingCompleted)
                      AudioMessage(
                        path: path,
                        isSender: true,
                        appDirectory: appDirectory,
                        time: onlyTime.format(now),
                      ),
                    SizedBox(height: 90.h),
                  ],
                );
              }),
          MessageBar(
            focusNode: focusNode,
            onTapRefreshFile: controller.state.isRecording.value
                ? () {
                    _refreshWave();
                  }
                : () {},
            recorderController: recorderController,
            onTapVoice: _startOrStopRecording,
            messageBarHitText: "Enter your message",
            messageBarHintStyle: TextStyles.bodyMedium,
            onSend: (_) {},
          ),
        ],
      ),
    );
  }

  void _startOrStopRecording() async {
    try {
      if (controller.state.isRecording.value) {
        recorderController.reset();

        final path = await recorderController.stop(false);

        if (path != null) {
          isRecordingCompleted = true;
          debugPrint(path);
          debugPrint("Recorded file size: ${File(path).lengthSync()}");
        }
      } else {
        await recorderController.record(path: path!);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        controller.state.isRecording.value =
            !controller.state.isRecording.value;
      });
    }
  }

  void _refreshWave() {
    if (controller.state.isRecording.value) recorderController.refresh();
  }

  AppBar _chatAppBar() {
    return AppBar(
      backgroundColor: Palette.whiteColor,
      surfaceTintColor: Colors.transparent,
      elevation: 1,
      shadowColor: Palette.greyTextColor.withOpacity(0.2),
      centerTitle: false,
      leadingWidth: 40.sp,
      leading: InkWell(
        onTap: () => Get.back(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 16.w),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Palette.blackColor,
            size: 16,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            setting();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Icon(
              Icons.more_vert,
              color: Palette.primaryColor,
              size: 24.sp,
            ),
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
                          fit: BoxFit.cover,
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
    );
  }

  setting() {
    return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        1,
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Palette.whiteColor,
                borderRadius: BorderStyles.medium,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Report id".tr,
                                style: TextStyles.titleSmall,
                              ),
                            ],
                          ),
                          Image.asset(
                            reportIcon,
                            height: 28.w,
                            width: 28.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomDivider(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Delete".tr,
                                style: TextStyles.titleSmall.copyWith(
                                  color: Palette.redColor,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            deleteIcon,
                            height: 28.w,
                            width: 28.w,
                            color: Palette.redColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: SubmitButton(
                onTap: () => Get.back(),
                title: "Cancel",
                backGroundColor: Palette.whiteColor,
                titleColor: Palette.primaryColor,
              ),
            )
          ],
        );
      },
    );
  }

  // Widget _image() {
  //   return Container(
  //     constraints: const BoxConstraints(
  //       minHeight: 20.0,
  //       minWidth: 20.0,
  //     ),
  //     child: CachedNetworkImage(
  //       imageUrl: 'https://i.ibb.co/JCyT1kT/Asset-1.png',
  //       progressIndicatorBuilder: (context, url, downloadProgress) =>
  //           CircularProgressIndicator(value: downloadProgress.progress),
  //       errorWidget: (context, url, error) => const Icon(Icons.error),
  //     ),
  //   );
  // }
}
