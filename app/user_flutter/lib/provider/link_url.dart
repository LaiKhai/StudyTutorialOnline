import 'package:url_launcher/url_launcher_string.dart';

class linkUrl {
  static Future openLink({required String url}) => _lauchUrl(url);

  static Future _lauchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url,
          mode: LaunchMode.externalNonBrowserApplication);
    }
  }
}
