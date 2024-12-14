import 'package:flutter/material.dart';
import 'package:project_podcast1/ui/loginview.dart';
import 'package:project_podcast1/ui/myhomepage.dart';
import 'package:project_podcast1/ui/registerview.dart';
import 'package:project_podcast1/ui/podcasthome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final String _appName = "Podcast App";
  final String _appTitle = "Podcast & co.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
      initialRoute: "/",
      routes: {
        '/' : (context) => PodcastHome(title: _appTitle),
        '/login': (context) => Loginview(title: _appTitle),
        '/register' : (context) => Registerview(title: _appTitle),
        '/test' : (context) => MyHomePage(title: _appTitle),
      },
    );
  }
}
