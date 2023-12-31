import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/about_page.dart';
import 'package:flutter_portfolio/pages/articles_page.dart';
import 'components/my_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = true;

  void _changeDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  bool _getIsDarkMode() {
    return _isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'knot',
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 63, 101, 234),
          useMaterial3: true,
          brightness: _isDarkMode ? Brightness.dark : Brightness.light),
      home: MyHomePage(changeDarkMode: _changeDarkMode, isDarkMode: _getIsDarkMode),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback changeDarkMode;
  final bool Function() isDarkMode;
  const MyHomePage({Key? key, required this.changeDarkMode, required this.isDarkMode}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.changeDarkMode,
        child: const Icon(Icons.light_mode),
      ),
    );
  }
}
