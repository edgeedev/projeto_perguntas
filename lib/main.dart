import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(AppPerguntas());
}

class AppPerguntas extends StatefulWidget {
  @override
  _AppPerguntasState createState() => _AppPerguntasState();
}

class _AppPerguntasState extends State<AppPerguntas> {
  var _perguntasSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responderPerguntas(int pontuacao) {
    setState(() {
      _perguntasSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print(_pontuacaoTotal);
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': "Qual o sua cor preferida ?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 1},
      ]
    },
    {
      'texto': "Qual seu animal preferido?",
      'respostas': [
       {'texto':'Coelho','pontuacao': 10} ,
       {'texto':'Cobra', 'pontuacao': 5} ,
       {'texto':'Elefante', 'pontuacao': 3} ,
       {'texto':'Leao', 'pontuacao': 1} ,
      ]
    }
  ];

  bool get temPerguntasSelecionada {
    return _perguntasSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: temPerguntasSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntasSelecionada: _perguntasSelecionada,
                responder: _responderPerguntas,
              )
            : Resultado(),
      ),
    );
  }
}
