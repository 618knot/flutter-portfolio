import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

Future<String?> fetchOGPImage(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final document = htmlParser.parse(response.body);

      // OGP画像のmetaタグを検索
      final ogImageTag = document.querySelector('meta[property="og:image"]');

      if (ogImageTag != null) {
        // OGP画像のURLを取得
        final ogImageUrl = ogImageTag.attributes['content'];
        return ogImageUrl;
      }
    }
  } catch (e) {
    throw 'Error fetching OGP image: $e';
  }

  return null;
}
