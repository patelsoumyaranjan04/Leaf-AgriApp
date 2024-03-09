import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;



class MessageComposer extends StatefulWidget {
  MessageComposer({
    required this.onSubmitted,
    required this.awaitingResponse,
    Key? key,
  }) : super(key: key);

  final TextEditingController _messageController = TextEditingController();

  final void Function(String) onSubmitted;
  final bool awaitingResponse;

  @override
  _MessageComposerState createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech.initialize(
      onStatus: (status) {
        if (status == stt.SpeechToText.listeningStatus) {
          setState(() {
            _isListening = true;
          });
        } else {
          setState(() {
            _isListening = false;
          });
        }
      },
    );
  }

  void _startListening() async {
    if (!_isListening) {
      await _speech.listen(
        onResult: (result) {
          if (result.finalResult) {
            widget._messageController.text = result.recognizedWords;
          }
        },
      );
    }
  }

  void _stopListening() {
    if (_isListening) {
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.05),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: !widget.awaitingResponse
                  ? TextField(
                controller: widget._messageController,
                onSubmitted: widget.onSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Write your message here...',
                  border: InputBorder.none,
                ),
              )
                  : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Fetching response...'),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: !widget.awaitingResponse
                  ? () => widget.onSubmitted(widget._messageController.text)
                  : null,
              icon: const Icon(Icons.send),
            ),
            IconButton(
              onPressed: () {
                if (!_isListening) {
                  _startListening();
                } else {
                  _stopListening();
                }
              },
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stopListening(); // Stop listening when the widget is disposed
    super.dispose();
  }
}
