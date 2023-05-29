import 'package:chat_gpt_app/message-page.dart';
import 'package:chat_gpt_app/netowrk-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  NetworkService.token = dotenv.env['TOKEN'] ?? "";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MessagePage(),
      },
    );
  }
}
