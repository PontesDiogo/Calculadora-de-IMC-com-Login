import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: const Center(
        child: Text("Tela de Cadastro"),
      ),
    );
  }
}
