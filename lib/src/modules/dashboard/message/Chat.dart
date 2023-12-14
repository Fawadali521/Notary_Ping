// ignore_for_file: file_names

import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:notary_ping/src/constant/time_formate.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/AudioMessage.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/MessageBar.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/TextMessage.dart';
import 'package:notary_ping/src/states/message/MessageController.dart';
import 'package:notary_ping/src/utility/CustomDivider.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../index.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final MessageController controller = Get.find();

  late final RecorderController recorderController;

  String? path;
  String? musicFile;

  bool isRecordingCompleted = false;
  bool isLoading = true;
  late Directory appDirectory;

  @override
  void initState() {
    super.initState();
    _getDir();
    _initialiseControllers();
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

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      backgroundColor: Palette.whiteColor,

      appBar: _chatAppBar(),

      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Row(
                  //   children: [
                  //     AnimatedSwitcher(
                  //       duration: const Duration(milliseconds: 200),
                  //       child: controller.state.isRecording.value
                  //           ? AudioWaveforms(
                  //               enableGesture: true,
                  //               size: Size(
                  //                   MediaQuery.of(context).size.width / 2, 50),
                  //               recorderController: recorderController,
                  //               waveStyle: const WaveStyle(
                  //                 waveColor: Colors.white,
                  //                 extendWaveform: true,
                  //                 showMiddleLine: false,
                  //               ),
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(12.0),
                  //                 color: const Color(0xFF1E1B26),
                  //               ),
                  //               padding: const EdgeInsets.only(left: 18),
                  //               margin:
                  //                   const EdgeInsets.symmetric(horizontal: 15),
                  //             )
                  //           : Container(
                  //               width: MediaQuery.of(context).size.width / 1.7,
                  //               height: 50,
                  //               decoration: BoxDecoration(
                  //                 color: const Color(0xFF1E1B26),
                  //                 borderRadius: BorderRadius.circular(12.0),
                  //               ),
                  //               padding: const EdgeInsets.only(left: 18),
                  //               margin:
                  //                   const EdgeInsets.symmetric(horizontal: 15),
                  //               child: const TextField(
                  //                 readOnly: true,
                  //                 decoration: InputDecoration(
                  //                   hintText: "Type Something...",
                  //                   hintStyle: TextStyle(color: Colors.white54),
                  //                   contentPadding: EdgeInsets.only(top: 16),
                  //                   border: InputBorder.none,
                  //                   // suffixIcon: IconButton(
                  //                   //   onPressed: _pickFile,
                  //                   //   icon: Icon(Icons.adaptive.share),
                  //                   //   color: Colors.white54,
                  //                   // ),
                  //                 ),
                  //               ),
                  //             ),
                  //     ),
                  //     IconButton(
                  //       onPressed: _refreshWave,
                  //       icon: Icon(
                  //         controller.state.isRecording.value
                  //             ? Icons.refresh
                  //             : Icons.send,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 16),
                  //     IconButton(
                  //       onPressed: _startOrStopRecording,
                  //       icon: Icon(controller.state.isRecording.value
                  //           ? Icons.stop
                  //           : Icons.mic),
                  //       color: Colors.black,
                  //       iconSize: 28,
                  //     ),
                  //   ],
                  // ),

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
                              const Text(
                                "Fawad",
                                style: TextStyles.bodyLarge,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
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
                              const Text(
                                "Fawad",
                                style: TextStyles.bodyLarge,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
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
              ),
            ),
            MessageBar(
              recorderController: recorderController,
              onTapVoice: _startOrStopRecording,
              messageBarHitText: "Enter your message",
              messageBarHintStyle: TextStyles.bodyMedium,
              onSend: (_) => print(_),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Palette.blackColor,
            size: 16.sp,
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
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 140.w,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          reportIcon,
                          height: 28.w,
                          width: 28.w,
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Text(
                            "Report id".tr,
                            style: TextStyles.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CustomDivider(),
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          deleteIcon,
                          height: 28.w,
                          width: 28.w,
                          color: Palette.redColor,
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Text(
                            "Delete".tr,
                            style: TextStyles.titleSmall.copyWith(
                              color: Palette.redColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _image() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 20.0,
        minWidth: 20.0,
      ),
      child: CachedNetworkImage(
        imageUrl: 'https://i.ibb.co/JCyT1kT/Asset-1.png',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
