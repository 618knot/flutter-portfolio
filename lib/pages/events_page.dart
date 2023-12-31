import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/ogp_content.dart';
import 'package:flutter_portfolio/utility/get_request.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRequest(
            url:
                'https://connpass.com/api/v1/event/?nickname=knot&owner_nickname=knot&order=2&count=100&format=json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // データがまだ取得されていない場合の表示
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data == null) {
            return const Center(child: Text('イベントを読み込めませんでした'));
          } else {
            // データが取得できた場合の表示;
            var events = snapshot.data!;
            if (!events.containsKey('events')) {
              return const Center(child: Text('イベントデータがありません'));
            }

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    for (var event in events['events'])
                      OgpContent(
                          title: event['title'], url: event['event_url']),
                  ],
                ),
              ),
            );
          }
        });
  }
}
