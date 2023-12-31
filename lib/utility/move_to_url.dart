import 'package:url_launcher/url_launcher.dart';

void moveToUrl({String? url}) async {
  Uri uri = Uri.parse(url!);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
