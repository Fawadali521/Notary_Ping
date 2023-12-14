// ignore_for_file: file_names, constant_identifier_names

import '../../../../../index.dart';

const double BUBBLE_RADIUS = 16;

class TextMessage extends StatelessWidget {
  final double bubbleRadius;
  final bool isSender;
  final String text;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;
  final TextStyle timeStyle;
  final BoxConstraints? constraints;
  final String? time;

  const TextMessage({
    Key? key,
    required this.text,
    this.constraints,
    this.bubbleRadius = BUBBLE_RADIUS,
    this.isSender = true,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.time,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
    this.timeStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
  }) : super(key: key);

  ///chat bubble builder method
  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Row(
      children: <Widget>[
        isSender
            ? const Expanded(
                child: SizedBox(
                  width: 5,
                ),
              )
            : Container(),
        Container(
          color: Colors.transparent,
          constraints: constraints ??
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .8),
          child: Padding(
            padding: !isSender
                ? EdgeInsets.only(right: MediaQuery.of(context).size.width * .2)
                : const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: time == null ? 10 : 20),
                  decoration: BoxDecoration(
                    color: isSender
                        ? Palette.primaryColor
                        : Palette.reciveChatColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(bubbleRadius),
                      bottomRight: Radius.circular(bubbleRadius),
                      topLeft: Radius.circular(tail
                          ? isSender
                              ? bubbleRadius
                              : 0
                          : BUBBLE_RADIUS),
                      topRight: Radius.circular(tail
                          ? isSender
                              ? 0
                              : bubbleRadius
                          : BUBBLE_RADIUS),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Padding(
                        padding: stateTick
                            ? const EdgeInsets.fromLTRB(12, 6, 28, 6)
                            : const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                        child: Padding(
                          padding: text.length < 6
                              ? const EdgeInsets.symmetric(horizontal: 20)
                              : EdgeInsets.zero,
                          child: Text(
                            text,
                            style: textStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      stateIcon != null && stateTick
                          ? Positioned(
                              bottom: 4,
                              right: 6,
                              child: stateIcon,
                            )
                          : const SizedBox(
                              width: 1,
                            ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 8,
                  child: Text(
                    time ?? "",
                    style: timeStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
