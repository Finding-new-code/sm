import 'package:google_generative_ai/google_generative_ai.dart';
class GeminiLLm {
  // ...
  final String apikey = 'AIzaSyAkWsQ7VtGTlevdDT3TqNwkufcPe7HfV3Q';
  Future<String> contentfiltering() async {
    // TODO: gemini ai will be used for the content moderation and content filtering
    return 'contentfiltering';
  }

  Future<ChatSession> chatbot() async {
    final _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apikey,
    );
    return _model.startChat();
  }
}
