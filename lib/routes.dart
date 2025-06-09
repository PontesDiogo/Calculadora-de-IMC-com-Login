import 'package:flutter/material.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/imc_view.dart';

// Apenas o mapa de rotas deve estar aqui
final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginView(),
  '/register': (context) => const RegisterView(),
  '/imc': (context) => const ImcView(),
};

// Remova qualquer função de lógica (_login) deste arquivo.
// A função _login deve estar dentro do widget de login, não aqui.
