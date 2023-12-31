import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/ogp_content.dart';
import 'package:flutter_portfolio/utility/get_request.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getRequest(url: 'https://zenn.dev/api/articles?username=knot&order=latest'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // データがまだ取得されていない場合の表示
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data == null) {
          return const Center(child: Text('記事を読み込めませんでした'));
        } else {
          // データが取得できた場合の表示
          var articles = snapshot.data!;

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  for (var article in articles['articles'])
                    OgpContent(
                        title: article['title'],
                        url: 'https://zenn.dev${article['path']}'),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
