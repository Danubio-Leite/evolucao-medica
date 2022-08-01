import 'dart:math';
import 'package:flutter/material.dart';
import '../data/dummy_profiles.dart';
import '../models/paciente.dart';

class Pacientes with ChangeNotifier {
  Map<String, Paciente> _items = {...DUMMY_PROFILES};

  List<Paciente> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Paciente byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Paciente paciente) {
    if (paciente == null) {
      return;
    }

    if (paciente.id != null &&
        paciente.id!.trim().isNotEmpty &&
        _items.containsKey(paciente.id)) {
      _items.update(paciente.id!, (_) => paciente);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
            () => Paciente(
          id: id,
          name: paciente.name,
          leito: paciente.leito,
          cpf: paciente.cpf,
              prescricao: paciente.prescricao,
              hipotese: paciente.hipotese,
              evolucao: paciente.evolucao,
              parametros: paciente.parametros,
              exames: paciente.exames,
              informacoes: paciente.informacoes,
        ),
      );
    }

    //O notify abaixo atualiza a tela, pesquisar sobre!
    notifyListeners();
  }

  void remove(Paciente paciente) {
    if(paciente != null && paciente.id != null) {
      _items.remove(paciente.id);
      notifyListeners();
    }
  }
}