

List<String> getHastags (String text) {
  List<String> wordsinsentence = text.split(' ');
  List<String> hastags = [];
  for (String word in wordsinsentence) {
    if (word.startsWith('#')) {
      hastags.add(word);
    }
  }
  return hastags;
}

String linksfromtext(String text) {
  List<String> wordsinsentence = text.split(' ');
  String links = '';
  for (String word in wordsinsentence) {
    if (word.startsWith('https://') || word.startsWith('www.')) {
      links = word;
    }
  }
  return links;
}


enum TweetType {
  text('text'),
  image('image');

  final String type;
  const TweetType(this.type);
}

extension ConvertTweet on String {
  TweetType toTweetTypeEnum() {
    switch (this) {
      case 'text':
        return TweetType.text;
      case 'image':
        return TweetType.image;
      default:
        return TweetType.text;
    }
  }
}

String getNameFromEmail(String email) {
  return email.split('@')[0];
}

// void _scrollDown() {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) => _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(
//           milliseconds: 750,
//         ),
//         curve: Curves.easeOutCirc,
//       ),
//     );
//   }