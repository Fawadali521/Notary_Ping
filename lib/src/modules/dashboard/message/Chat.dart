// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:notary_ping/src/constant/time_formate.dart';
import 'package:notary_ping/src/modules/dashboard/message/MessageBar.dart';
import 'package:notary_ping/src/modules/dashboard/message/TextMessage.dart';

import '../../../../index.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      backgroundColor: Palette.whiteColor,

      appBar: _chatAppBar(),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // BubbleNormalImage(
                //   id: 'id001',
                //   image: _image(),
                //   color: Colors.transparent,
                //   tail: true,
                // ),
                // BubbleNormalAudio(
                //   color: Palette.primaryColor,
                //   duration: duration.inSeconds.toDouble(),
                //   position: position.inSeconds.toDouble(),
                //   isPlaying: isPlaying,
                //   isLoading: isLoading,
                //   isPause: isPause,
                //   onSeekChanged: _changeSeek,
                //   onPlayPauseButtonClick: _playAudio,
                // ),
                const SizedBox(
                  height: 120,
                ),
                TextMessage(
                  text: 'bubble noal with normal with with tail',
                  isSender: false,
                  color: Palette.reciveChatColor,
                  tail: true,
                  textStyle: TextStyles.bodyMedium.copyWith(
                    color: Palette.blackColor,
                  ),
                  timeStyle: TextStyles.bodySmall,
                  time: onlyTime.format(now),
                ),
                TextMessage(
                  text:
                      'bubble normal with normal with normal with normal with normal with tail',
                  isSender: true,
                  color: Palette.primaryColor,
                  tail: true,
                  time: onlyTime.format(now),
                  timeStyle: TextStyles.bodySmall,
                  textStyle: TextStyles.bodyMedium.copyWith(
                    color: Palette.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          MessageBar(
            messageBarHitText: "Enter your message",
            messageBarHintStyle: TextStyles.bodyMedium,
            onSend: (_) => print(_),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AppBar _chatAppBar() {
    return AppBar(
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

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    const url =
        'https://file-examples.com/storage/fef1706276640fa2f99a5a4/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = const Duration();
        position = const Duration();
      });
    });
  }
}
