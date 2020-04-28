import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function(int) responder;

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
    List<Map<String,Object>> respostas = temPerguntasSelecionada ? 
    perguntas[perguntasSelecionada]['respostas'] 
    : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntasSelecionada]['texto']),
        ...respostas.map((resposta) {
          return Resposta(
            resposta['texto'], 
          () => responder(resposta['pontuacao'])
          );
        }).toList(),
      ],
    );
  }
}
