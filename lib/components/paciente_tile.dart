import 'package:flutter/material.dart';
import '../models/paciente.dart';
import 'package:provider/provider.dart';

import '../provider/pacientes.dart';
import '../routes/app_routes.dart';


class PacienteTile extends StatelessWidget {

  final Paciente paciente;
  const PacienteTile(this.paciente);

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      backgroundColor: Color.fromRGBO(27, 99, 140, 1.0),
      child: Image.asset('images/cama.png',
        scale: 20,
        color: Color.fromRGBO(190, 211, 218, 1.0),
      ),
    );

    return ListTile(
        leading: avatar,
        title: Text(paciente.name.toString()),
    subtitle: Text(paciente.leito.toString()),
    trailing: Container(
      width: 100,
      child: Row(children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.USER_FORM,
              arguments: paciente,);
          },
          icon: Icon(Icons.edit, color: Colors.blueAccent),
        ),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Paciente'),
                  content: Text('Tem Certeza?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Não'),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<Pacientes>(context, listen: false).remove(paciente);
                        Navigator.of(context).pop();
                      },
                      child: Text('Sim'),
                    ),
                  ],
                ));
          },
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ]),
    )
    );
  }
}

