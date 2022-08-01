import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/paciente.dart';
import '../provider/pacientes.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Paciente paciente) {
    if (paciente != null) {
      _formData['id'] = paciente.id!;
      _formData['name'] = paciente.name!;
      _formData['leito'] = paciente.leito!;
      _formData['cpf'] = paciente.cpf!;
      _formData['prescricao'] = paciente.prescricao!;
      _formData['hipotese'] = paciente.hipotese!;
      _formData['evolucao'] = paciente.evolucao!;
      _formData['parametros'] = paciente.parametros!;
      _formData['exames'] = paciente.exames!;
      _formData['informacoes'] = paciente.informacoes!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as Paciente;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();

              if(isValid != null) {
                _form.currentState?.save();

                Provider.of<Pacientes>(context, listen: false).put(Paciente(
                  id: _formData['id'],
                  name: _formData['name'],
                  leito: _formData['leito'],
                  cpf: _formData['cpf'],
                  prescricao: _formData['prescricao'],
                  hipotese: _formData['hipotese'],
                  evolucao: _formData['evolucao'],
                  parametros: _formData['parametros'],
                  exames: _formData['exames'],
                  informacoes: _formData['informacoes'],
                ));

                Navigator.of(context).pop();
              } else{
                print('O formdata é nulo');
              };
            },
            icon: Icon(Icons.save),)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                //Pesquisar sobre validator, metodo utilizado para
                //definir e validar paremetros para um campo do formulario
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty) {
                    return 'Ocorreu um erro';
                  }
                  if(value.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo três letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['leito'],
                decoration: InputDecoration(labelText: 'Leito'),
                onSaved: (value) => _formData['leito'] = value!,
              ),
              TextFormField(
                initialValue: _formData['cpf'],
                decoration: InputDecoration(labelText: 'CPF'),
                onSaved: (value) => _formData['cpf'] = value!,
              ),
              TextFormField(
                initialValue: _formData['prescricao'],
                decoration: InputDecoration(labelText: 'Prescrição'),
                onSaved: (value) => _formData['prescricao'] = value!,
              ),
              TextFormField(
                initialValue: _formData['hipotese'],
                decoration: InputDecoration(labelText: 'Hipótese Diagnóstica'),
                onSaved: (value) => _formData['hipotese'] = value!,
              ),
              TextFormField(
                initialValue: _formData['evolucao'],
                decoration: InputDecoration(labelText: 'Evolução'),
                onSaved: (value) => _formData['evolucao'] = value!,
              ),
              TextFormField(
                initialValue: _formData['parametros'],
                decoration: InputDecoration(labelText: 'Parâmetros'),
                onSaved: (value) => _formData['parametros'] = value!,
              ),
              TextFormField(
                initialValue: _formData['exames'],
                decoration: InputDecoration(labelText: 'Exames'),
                onSaved: (value) => _formData['exames'] = value!,
              ),
              TextFormField(
                initialValue: _formData['informacoes'],
                decoration: InputDecoration(labelText: 'Informações Adicionais'),
                onSaved: (value) => _formData['informacoes'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}