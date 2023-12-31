import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utility/fetch_ogp_image.dart';
import 'package:flutter_portfolio/utility/move_to_url.dart';
import 'package:nil/nil.dart';

class OgpContent extends StatelessWidget {
  final String title;
  final String url;
  const OgpContent({super.key, required this.title, required this.url});

  @override
Widget build(BuildContext context) {
  return FutureBuilder<String?>(
    future: fetchOGPImage(url),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // データがまだ解決されていない場合の表示
        return const CircularProgressIndicator();
      } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
        return nil;
      } else {
        // データが解決され、かつnullでない場合の表示
        return Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                child: InkWell(
                  onTap: () => moveToUrl(url: url),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: 18.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400.0),
                          child: Image.network(
                            snapshot.data!,
                            width: MediaQuery.of(context).size.width * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    },
  );
}
}
