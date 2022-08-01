import 'package:evolucao_de_pacientes/provider/pacientes.dart';
import 'package:evolucao_de_pacientes/routes/app_routes.dart';
import 'package:evolucao_de_pacientes/views/form_paciente.dart';
import 'package:evolucao_de_pacientes/views/lista_paciente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Pacientes(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          //O AppRoutes.HOME substitui o home que seria apresentado acima
          AppRoutes.HOME: (_) => ListaPacientes(),
          AppRoutes.USER_FORM: (ctx) => UserForm(),
        },
      ),
    );
  }
}