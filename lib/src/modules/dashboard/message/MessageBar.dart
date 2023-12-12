import 'package:notary_ping/index.dart';
import 'package:notary_ping/src/utility/CustomDivider.dart';

class MessageBar extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final String messageBarHitText;
  final TextStyle messageBarHintStyle;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onTapCloseReply;

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
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDivider(
            color: Palette.primaryColor.withOpacity(0.3),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20.w),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _textController,
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 1,
                    maxLines: 3,
                    onChanged: onTextChanged,
                    decoration: InputDecoration(
                      hintText: messageBarHitText,
                      hintMaxLines: 1,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      hintStyle: messageBarHintStyle,
                      fillColor: Palette.bgTextFeildColor,
                      filled: true,
                      alignLabelWithHint: true,
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Palette.primaryColor,
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                      suffixIcon: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 4),
                            child: Icon(
                              Icons.attach_file,
                              color: Palette.primaryColor,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4, right: 10),
                            child: Icon(
                              Icons.keyboard_voice,
                              color: Palette.primaryColor,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: const BorderSide(
                          color: Palette.bgTextFeildColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: const BorderSide(
                          color: Palette.bgTextFeildColor,
                        ),
                      ),
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
        ],
      ),
    );
  }
}
