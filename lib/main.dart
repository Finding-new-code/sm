import 'package:flutter/material.dart';
import 'package:myapp/Pages/AuthPage/authpage.dart';
import 'package:myapp/Pages/HomePage/homepage.dart';
import 'package:myapp/Pages/WelcomePage/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/welcome",
      routes: {
        '/welcome':(context) => const WelcomePage()
      },
      home: const HomePage(),
    );
  }
}

