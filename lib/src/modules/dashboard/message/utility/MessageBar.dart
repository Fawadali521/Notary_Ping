// ignore_for_file: file_names

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:notary_ping/src/states/message/MessageController.dart';

import '../../../../../index.dart';

class MessageBar extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
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
  MessageBar({
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
  final MessageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20.w),
        // color: Palette.whiteColor,
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
                              recorderController: recorderController,
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
                                  onPressed: () {},
                                ),
                                Expanded(
                                  child: TextFormField(
                                    focusNode: focusNode,
                                    controller: _textController,
                                    keyboardType: TextInputType.multiline,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    minLines: 1,
                                    maxLines: 3,
                                    onChanged: onTextChanged,
                                    decoration: InputDecoration(
                                      hintText: messageBarHitText,
                                      hintMaxLines: 1,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 14),
                                      hintStyle: messageBarHintStyle,
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
                          onTap: onTapRefreshFile,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 4),
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
                          onTap: onTapVoice,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4, right: 10),
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
                  if (onSend != null) {
                    onSend!(_textController.text.trim());
                  }
                  _textController.text = '';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
