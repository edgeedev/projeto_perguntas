import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

main (){
  runApp(AppPerguntas());
}

class AppPerguntas extends StatefulWidget {
  @override
  _AppPerguntasState createState() => _AppPerguntasState();
}

class _AppPerguntasState extends State<AppPerguntas> {  

  var _perguntasRespondidas = 0;

  void _responderPerguntas(){
    
    setState(() {
        _perguntasRespondidas++;
    });
  
  }

  List perguntas = [
    "Qual o sua cor preferida ?",
    "Qual seu animal preferido?"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntasRespondidas]),
            Resposta("Resposta 1", _responderPerguntas),
            Resposta("Resposta 2",_responderPerguntas),
            Resposta("Resposta 3",_responderPerguntas),
          ],
        ),
      ),
    );

  }
}