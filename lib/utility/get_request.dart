import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getRequest({String? url}) async {
  final Uri uri = Uri.parse(url!);

  if (await canLaunchUrl(uri)) {
    var response = await http.get(uri);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
  
  throw 'Could not launch $uri';
}
