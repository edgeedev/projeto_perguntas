import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function() reiniciar;

  Resultado(this.pontuacao, this.reiniciar);
  
  String get mensage {
    if(pontuacao < 8){
      return 'Paarabens!';
    }else if(pontuacao < 12){
      return 'Voce e bom';
    }else if(pontuacao <15){
      return 'Voce e muito bom!';
    }else {
      return 'Voce sabe tudo sobre Edward';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            mensage,
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "Sua pontuação foi $pontuacao",
            style: TextStyle(fontSize: 28),
          ),
          FlatButton(
            child: Text("Reiniciar ?",style: TextStyle(fontSize: 18)),
            textColor: Colors.blue,
            onPressed: reiniciar,
          ),
        ],
      ),
    );
  }
}