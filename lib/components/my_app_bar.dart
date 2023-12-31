import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);
  static const List<String> _contents = ["about", "articles", "events"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _contents.length,
        child: AppBar(
          title: const Text('knot'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
              isScrollable: true,
              tabs: _contents.map((String content) {
                return Tab(text: content);
              }).toList()),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25.0);
}
