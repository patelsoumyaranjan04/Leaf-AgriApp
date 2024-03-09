import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MessageBubble extends StatefulWidget {
  MessageBubble({
    required this.content,
    required this.isUserMessage,
    Key? key,
  }) : super(key: key);

  final String content;
  final bool isUserMessage;

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _speakText(String text) async {
    await flutterTts.setLanguage("en-IN"); // Set the language (adjust as needed)
    await flutterTts.setSpeechRate(0.5); // Set speech rate (adjust as needed)
    await flutterTts.setVolume(1.0); // Set volume (adjust as needed)
    await flutterTts.speak(text);
    setState(() {
      isSpeaking = true;
    });
  }

  Future<void> _stopSpeaking() async {
    if (isSpeaking) {
      await flutterTts.stop();
      setState(() {
        isSpeaking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.isUserMessage
            ? themeData.colorScheme.primary.withOpacity(0.4)
            : themeData.colorScheme.secondary.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.isUserMessage ? 'You' : 'AI',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (isSpeaking)
                  IconButton(
                    icon: Icon(Icons.stop, color: Colors.red), // Stop button
                    onPressed: _stopSpeaking,
                  ),
                if (!isSpeaking)
                  IconButton(
                    icon: Icon(Icons.volume_up, color: Colors.black), // Play button
                    onPressed: () {
                      _speakText(widget.content); // Call _speakText when the icon is tapped
                    },
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.content, // Show the entire content
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
