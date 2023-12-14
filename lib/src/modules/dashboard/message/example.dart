import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:notary_ping/src/modules/dashboard/message/utility/AudioMessage.dart';
import 'package:path_provider/path_provider.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late final RecorderController recorderController;

  String? path;
  bool isRecording = false;
  bool isRecordingCompleted = false;
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
    return Scaffold(
      backgroundColor: const Color(0xFF252331),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (_, index) {
                  return AudioMessage(
                    index: index,
                    isSender: index.isOdd,
                    // width: MediaQuery.of(context).size.width / 2,
                    appDirectory: appDirectory,
                  );
                },
              ),
            ),
            if (isRecordingCompleted)
              AudioMessage(
                path: path,
                isSender: true,
                appDirectory: appDirectory,
              ),
            // if (musicFile != null)
            //   WaveBubble(
            //     path: musicFile,
            //     isSender: true,
            //     appDirectory: appDirectory,
            //   ),
            Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: isRecording
                      ? AudioWaveforms(
                          enableGesture: true,
                          size: Size(MediaQuery.of(context).size.width / 2, 50),
                          recorderController: recorderController,
                          waveStyle: const WaveStyle(
                            waveColor: Colors.white,
                            extendWaveform: true,
                            showMiddleLine: false,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFF1E1B26),
                          ),
                          padding: const EdgeInsets.only(left: 18),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width / 1.7,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1B26),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.only(left: 18),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "Type Something...",
                              hintStyle: const TextStyle(color: Colors.white54),
                              contentPadding: const EdgeInsets.only(top: 16),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.adaptive.share),
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                ),
                IconButton(
                  onPressed: _refreshWave,
                  icon: Icon(
                    isRecording ? Icons.refresh : Icons.send,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: _startOrStopRecording,
                  icon: Icon(isRecording ? Icons.stop : Icons.mic),
                  color: Colors.white,
                  iconSize: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startOrStopRecording() async {
    try {
      if (isRecording) {
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
        isRecording = !isRecording;
      });
    }
  }

  void _refreshWave() {
    if (isRecording) recorderController.refresh();
  }
}
