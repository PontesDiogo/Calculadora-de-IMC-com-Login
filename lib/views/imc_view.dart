import 'package:flutter/material.dart';

class ImcView extends StatelessWidget {
  const ImcView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora IMC")),
      body: const Center(
        child: Text("Tela IMC"),
      ),
    );
  }
}
