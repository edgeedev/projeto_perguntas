import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function() responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntasSelecionada,
    @required this.responder,
  });

  bool get temPerguntasSelecionada {
    return perguntasSelecionada < perguntas.length;
  }


  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntasSelecionada ? 
    perguntas[perguntasSelecionada]['respostas'] 
    : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntasSelecionada]['texto']),
        ...respostas.map((resposta) => Resposta(resposta, responder)).toList(),
      ],
    );
  }
}
