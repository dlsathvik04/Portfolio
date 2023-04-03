import 'package:flutter/material.dart';
import 'package:portfolio/providers/current_content_provider.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentContentProvider(),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: MaterialApp(
          title: 'D.L.Sathvik',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
