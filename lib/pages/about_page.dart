import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utility/move_to_url.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutPage extends StatelessWidget {
  final bool Function() isDarkMode;
  const AboutPage({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(flex: 18),
          Container(
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/82982400?v=4'))),
          ),
          const Spacer(flex: 1),
          Text(
            'knot',
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 30.0),
          ),
          const Spacer(flex: 3),
          Center(
            child: Row(
              children: [
                const Spacer(flex: 7),
                // GitHubリンク
                InkWell(
                  onTap: () {
                    moveToUrl(url: 'https://github.com/618knot');
                  },
                  child: SvgPicture.asset(
                    'images/github.svg',
                    width: 40.0,
                    height: 40.0,
                    colorFilter:
                        isDarkMode() ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
                const Spacer(flex: 1),
                // Xリンク
                InkWell(
                  onTap: () {
                    moveToUrl(url: 'https://twitter.com/618knot');
                  },
                  child: SvgPicture.asset(
                    'images/x.svg',
                    width: 35.0,
                    height: 35.0,
                    colorFilter:
                        isDarkMode() ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
                const Spacer(flex: 1),
                // zennリンク
                InkWell(
                  onTap: () {
                    moveToUrl(url: 'https://zenn.dev/knot');
                  },
                  child: SvgPicture.asset(
                    'images/zenn.svg',
                    width: 40.0,
                    height: 40.0,
                    colorFilter:
                        isDarkMode() ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
                const Spacer(flex: 7),
              ],
            ),
          ),
          const Spacer(flex: 24),
        ],
      ),
    );
  }
}
