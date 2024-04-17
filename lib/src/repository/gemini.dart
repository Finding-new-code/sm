import 'package:google_generative_ai/google_generative_ai.dart';
class GeminiLLm {
  // ...
  final String apikey = 'AIzaSyB6o4N2y3mrhltQkq5Aa2rO2914fnobfTk';
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
