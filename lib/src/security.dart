import 'package:freerasp/freerasp.dart';

class Security {
  config() {
    TalsecConfig(
      /// For Android
      androidConfig: AndroidConfig(
        packageName: 'your.package.name',
        signingCertHashes: ['AKoRu...'],
        supportedStores: ['some.other.store'],
      ),

      /// For iOS
      iosConfig: IOSConfig(
        bundleIds: ['YOUR_APP_BUNDLE_ID'],
        teamId: 'M8AK35...',
      ),
      watcherMail: 'satyaprakashnayak007@gmail.com',
      isProd: true,
    );
  }
}
