import 'package:flutter/material.dart';

class Paciente {
  final String? id;
  final String? name;
  final String? leito;
  final String? cpf;
  final String? prescricao;
  final String? hipotese;
  final String? evolucao;
  final String? parametros;
  final String? exames;
  final String? informacoes;

  const Paciente({
    required this.id,
    required this.name,
    required this.leito,
    required this.cpf,
    required this.prescricao,
    required this.hipotese,
    required this.evolucao,
    required this.parametros,
    required this.exames,
    required this.informacoes,
  });
}