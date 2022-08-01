import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../components/paciente_tile.dart';
import '../provider/pacientes.dart';
import 'package:provider/provider.dart';

class ListaPacientes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final pacientes = Provider.of<Pacientes>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: ListTile(
                title: Text('Evolução de Pacientes'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.group),
                title: Text('Grupos de Pacientes'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.wheelchair_pickup),
                title: Text('Gerenciamento de Pacientes'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurações'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: Text('Sobre o App'),
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(190.0),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/home_3.png'),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemCount: pacientes.count,
                itemBuilder: (ctx, i) => PacienteTile(pacientes.byIndex(i)),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(27, 99, 140, 1.0),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star_border,
                color: Color.fromRGBO(190, 211, 218, 1.0),
              ),
              label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded,
                  color: Color.fromRGBO(190, 211, 218, 1.0)),
              label: 'Procurar'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: Text('Função ainda não disponível'),
                content: Text('Em breve você vai poder adicionar novos pacientes por aqui.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('De boas'))
                ]),
          ),
        },
        backgroundColor: Color.fromRGBO(27, 99, 130, 1.0),
      child: Image.asset('images/adicionar_paciente.png',
          color: Color.fromRGBO(190, 211, 218, 1.0),
      scale: 18,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
