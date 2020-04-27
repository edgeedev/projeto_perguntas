import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String _texto;
  final void Function() responder;

  Resposta(this._texto, this.responder);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(_texto),
        onPressed: responder,
      ),
    );
  }
}
