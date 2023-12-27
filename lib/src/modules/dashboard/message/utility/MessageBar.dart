// ignore_for_file: file_names

import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:notary_ping/src/states/message/MessageController.dart';

import '../../../../../index.dart';

class MessageBar extends StatefulWidget {
  final String messageBarHitText;
  final TextStyle messageBarHintStyle;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onTapCloseReply;
  final VoidCallback onTapVoice;
  final VoidCallback onTapRefreshFile;
  final FocusNode focusNode;
  final RecorderController recorderController;

  /// [MessageBar] constructor
  ///
  ///
  const MessageBar({
    super.key,
    this.messageBarHitText = "Type your message",
    this.messageBarHintStyle = const TextStyle(fontSize: 16),
    this.onTextChanged,
    this.onSend,
    this.onTapCloseReply,
    required this.onTapVoice,
    required this.onTapRefreshFile,
    required this.recorderController,
    required this.focusNode,
  });

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  final TextEditingController _textController = TextEditingController();

  final MessageController controller = Get.find();
  bool emojiShowing = false;

  _onEmojiSelected(Emoji emoji) {
    _textController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));
    setState(() {
      // _send = true;
    });
  }

  _onBackspacePressed() {
    _textController
      ..text = _textController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Palette.whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20.w),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        color: Palette.bgTextFeildColor,
                      ),
                      child: Row(
                        children: [
                          controller.state.isRecording.value
                              ? Expanded(
                                  child: AudioWaveforms(
                                    enableGesture: true,
                                    size: const Size(double.minPositive, 50),
                                    recorderController:
                                        widget.recorderController,
                                    waveStyle: const WaveStyle(
                                      waveColor: Colors.black54,
                                      extendWaveform: true,
                                      showMiddleLine: false,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      color: Palette.bgTextFeildColor,
                                    ),
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.zero,
                                  ),
                                )
                              : Expanded(
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.emoji_emotions_outlined,
                                          color: Palette.primaryColor,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          // Get.to(const Home());
                                          setState(() {
                                            emojiShowing = !emojiShowing;
                                          });

                                          if (emojiShowing != false) {
                                            FocusScope.of(context).unfocus();
                                          } else {
                                            FocusScope.of(context)
                                                .requestFocus();
                                          }
                                        },
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          focusNode: widget.focusNode,
                                          controller: _textController,
                                          keyboardType: TextInputType.multiline,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          minLines: 1,
                                          maxLines: 3,
                                          onChanged: widget.onTextChanged,
                                          decoration: InputDecoration(
                                            hintText: widget.messageBarHitText,
                                            hintMaxLines: 1,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 14),
                                            hintStyle:
                                                widget.messageBarHintStyle,
                                            fillColor: Colors
                                                .transparent, // Palette.bgTextFeildColor,
                                            filled: true,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: widget.onTapRefreshFile,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 4),
                                  child: Icon(
                                    controller.state.isRecording.value
                                        ? Icons.refresh
                                        : Icons.attach_file,
                                    color: Palette.primaryColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: widget.onTapVoice,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 10),
                                  child: Icon(
                                    controller.state.isRecording.value
                                        ? Icons.stop
                                        : Icons.keyboard_voice,
                                    color: Palette.primaryColor,
                                    size: 24,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Palette.primaryColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    onTap: () {
                      if (_textController.text.trim() != '') {
                        if (widget.onSend != null) {
                          widget.onSend!(_textController.text.trim());
                        }
                        _textController.text = '';
                      }
                    },
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: !emojiShowing,
              child: SizedBox(
                height: 250,
                width: 1.sw,
                child: EmojiPicker(
                  textEditingController: _textController,
                  onBackspacePressed: _onBackspacePressed,
                  config: Config(
                    columns: 7,
                    emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: const Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.yellow,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.blue,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    recentTabBehavior: RecentTabBehavior.RECENT,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: const Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    loadingIndicator: const SizedBox.shrink(),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    // categoryIcons: CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                    // checkPlatformCompatibility: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
