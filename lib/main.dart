import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'knot',
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 63, 101, 234),
          useMaterial3: true,
          brightness: _isDarkMode ? Brightness.light : Brightness.dark),
      home: MyHomePage(changeDarkMode: _changeDarkMode),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback changeDarkMode;
  const MyHomePage({Key? key, required this.changeDarkMode}) : super(key: key);

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
