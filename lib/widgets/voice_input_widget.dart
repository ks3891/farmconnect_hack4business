import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceInputWidget extends StatefulWidget {
  final Function(String) onResult;

  const VoiceInputWidget({super.key, required this.onResult});

  @override
  State<VoiceInputWidget> createState() => _VoiceInputWidgetState();
}

class _VoiceInputWidgetState extends State<VoiceInputWidget> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('Status: $status'),
        onError: (error) => print('Error: $error'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          localeId: 'ne_NP', // Nepali
          onResult: (result) {
            setState(() {
              _spokenText = result.recognizedWords;
            });
            widget.onResult(_spokenText);
          },
        );
      }
    } else {
      _speech.stop();
      setState(() => _isListening = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: _listen,
          icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
          label: Text(_isListening ? 'Stop' : 'Speak in Nepali'),
        ),
        if (_spokenText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("You said: $_spokenText", style: const TextStyle(fontSize: 16)),
          ),
      ],
    );
  }
}
