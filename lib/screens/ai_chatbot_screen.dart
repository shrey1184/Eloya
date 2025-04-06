import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';
import '../widgets/custom_bottom_nav.dart';
import '../theme/app_colors.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  final String apiKey = 'AIzaSyBs6Myle1CqVMixWznaeT9I9w3DjnKLkJw'; // Replace with your Gemini API key

  Future<void> _sendMessage() async {
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey, generationConfig: GenerationConfig(
      temperature: 0.7,
    ));

    final prompt = _textController.text;
    _textController.clear();

    setState(() {
      _messages.add('User: $prompt');
    });

    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      final text = response.text;
      if (text != null) {
        setState(() {
          _messages.add('Gemini: $text');
        });
      } else {
        setState(() {
          _messages.add('Gemini: No response.');
        });
      }
    } catch (e) {
      setState(() {
        _messages.add('Error: $e');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          // Background decoration
          Positioned(
            top: -297,
            left: -367,
            child: Container(
              width: 904,
              height: 880,
              decoration: BoxDecoration(
                color: AppColors.backgroundBlur.withOpacity(0.25),
                borderRadius: BorderRadius.circular(400),
              ),
            ),
          ),

          // Main content
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_messages[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: 'Type your message...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
