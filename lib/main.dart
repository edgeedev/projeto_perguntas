import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

main() {
  runApp(AppPerguntas());
}

class AppPerguntas extends StatefulWidget {
  @override
  _AppPerguntasState createState() => _AppPerguntasState();
}

class _AppPerguntasState extends State<AppPerguntas> {
  var _perguntasSelecionada = 0;

  void _responderPerguntas() {
    setState(() {
      _perguntasSelecionada++;
    });
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': "Qual o sua cor preferida ?",
      'respostas': ['Preto', 'Vermelho', 'Azul', 'Verde']
    },
    {
      'texto': "Qual seu animal preferido?",
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leao']
    }
  ];

  bool get isSelecQuestion{
    return _perguntasSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    List<String> respostas = isSelecQuestion ?_perguntas[_perguntasSelecionada]['respostas']: null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: isSelecQuestion ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntasSelecionada]['texto']),
            ...respostas.map((resposta) => Resposta(resposta, _responderPerguntas)).toList(),
          ],
        ): null,
      ),
    );
  }
}
