class GeminiLLm {
  // ...
  final String apikey = 'AIzaSyB6o4N2y3mrhltQkq5Aa2rO2914fnobfTk';
  Future<String> contentfiltering() async {
    // TODO: gemini ai will be used for the content moderation and content filtering
    return 'contentfiltering';
  }

  Future<String> chatbot() async {
    // // TODO: and aslo for conversional chatbot
    // final _model = GenerativeModel(
    //   model: 'gemini-pro',
    //   apiKey: widget.apiKey,
    // );
    // _chat = _model.startChat();
    return 'chatbot';
  }
}
