import 'package:flutter/material.dart';
import 'package:provaflutter2diogo/views/home_page.dart';
import 'package:provaflutter2diogo/views/imc_view.dart';
import 'package:provaflutter2diogo/views/login_view.dart';
import 'package:provaflutter2diogo/views/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Flutter II',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/imc': (context) => const ImcView(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
