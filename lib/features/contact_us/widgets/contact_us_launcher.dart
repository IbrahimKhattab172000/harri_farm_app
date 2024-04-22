import 'package:url_launcher/url_launcher.dart';

class ContactUsLauncher {
  static Future<void> openUrl({required String path}) async {
    final Uri uri = Uri.tryParse(path) ?? Uri.parse('https://example.com');

    if (!await canLaunchUrl(uri)) {
      throw 'Could not launch $path';
    }

    await launchUrl(uri);
  }
}
