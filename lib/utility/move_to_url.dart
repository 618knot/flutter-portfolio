import 'package:url_launcher/url_launcher.dart';

void moveToUrl({String? host, String? path}) async {
  Uri url = Uri(scheme: 'https', host: host, path: path);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
