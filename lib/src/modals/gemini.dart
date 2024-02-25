
/// here the contents model
class Contents {
  final GenerativeConfig generativeConfig;
  final Parts parts;

  Contents({required this.parts, required this.generativeConfig});
}

/// here the parts model
class Parts {
  final String text;
  final List<InlineData> inlineData;

  Parts({required this.text, required this.inlineData});
}

/// here the generativeConfig model for configure ai parameters =>
class GenerativeConfig {
  final double temperature;
  final int topK;
  final int topP;
  final int maxOutputTokens;
  final List<dynamic> stopSequence;

  GenerativeConfig(
      {required this.temperature,
      required this.topK,
      required this.topP,
      required this.maxOutputTokens,
      required this.stopSequence});
}
/// here the inlineDAta model
class InlineData {
  final String minetype;
  final String data;

  InlineData({required this.minetype, required this.data});
}
