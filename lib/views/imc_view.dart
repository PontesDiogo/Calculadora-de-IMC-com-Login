import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ImcView extends StatefulWidget {
  const ImcView({super.key});

  @override
  State<ImcView> createState() => _ImcViewState();
}

class _ImcViewState extends State<ImcView> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _resultado = '';

  void _calcularIMC() {
    final double? peso =
        double.tryParse(_pesoController.text.replaceAll(',', '.'));
    final double? altura =
        double.tryParse(_alturaController.text.replaceAll(',', '.'));

    if (peso == null || altura == null) {
      setState(() {
        _resultado = 'Por favor, insira valores válidos.';
      });
      return;
    }

    if (peso <= 0 || altura <= 0) {
      setState(() {
        _resultado = 'Peso e altura devem ser maiores que zero.';
      });
      return;
    }

    if (altura >= 220) {
      setState(() {
        _resultado =
            'Altura inválida. Por favor, insira uma altura menor que 2,20 metros.';
      });
      return;
    }

    final double imc = peso / ((altura * altura) / 10000);
    String estado;

    if (imc < 16) {
      estado = 'Magreza grave';
    } else if (imc < 17) {
      estado = 'Magreza moderada';
    } else if (imc < 18.5) {
      estado = 'Magreza leve';
    } else if (imc < 25) {
      estado = 'Saudável';
    } else if (imc < 30) {
      estado = 'Sobrepeso';
    } else if (imc < 35) {
      estado = 'Obesidade I';
    } else if (imc < 40) {
      estado = 'Obesidade II (severa)';
    } else {
      estado = 'Obesidade III (mórbida)';
    }

    setState(() {
      _resultado = 'IMC: ${imc.toStringAsFixed(2)}\nEstado: $estado';
    });
  }

  @override
  Widget build(BuildContext context) {
    final String nomeUsuario = 'Usuário'; // Substitua pelo nome real do usuário

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.fitness_center,
                  size: 80, color: Colors.deepPurple),
              const SizedBox(height: 24),
              Text(
                '${saudacao()}, $nomeUsuario!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Altura (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _calcularIMC,
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _pesoController.clear();
                  _alturaController.clear();
                  setState(() => _resultado = '');
                },
                child: const Text('Limpar'),
              ),
              const SizedBox(height: 24),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserModel {
  final int? id;
  final String nome;
  final String sobrenome;
  final String email;
  final String senha;

  UserModel(
      {this.id,
      required this.nome,
      required this.sobrenome,
      required this.email,
      required this.senha});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'senha': senha,
    };
  }
}

String saudacao() {
  final hora = DateTime.now().hour;
  if (hora < 12) return 'Bom dia';
  if (hora < 18) return 'Boa tarde';
  return 'Boa noite';
}

Color getImcColor(double imc) {
  if (imc < 18.5) return Colors.blue;
  if (imc < 25) return Colors.green;
  if (imc < 30) return Colors.orange;
  return Colors.red;
}
