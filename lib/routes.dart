import 'package:flutter/material.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/imc_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginView(),
  '/register': (context) => RegisterView(),
  '/imc': (context) => ImcView(),
};
