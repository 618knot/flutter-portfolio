import 'package:url_launcher/url_launcher.dart';

void moveToUrl({String? url}) async {
  if (url == null) throw 'URL cannot be null';
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
