import 'package:flutter/material.dart';
import 'package:projeto_perguntas/quetao.dart';
import 'package:projeto_perguntas/resposta.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> pergutas = [
      {
        'texto': 'Qual é sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Xinxila', 'Urso Dourado'],
      },
      {
        'texto': 'Qual seu instrutor favorito?',
        'respostas': ['Maria', 'Pedro', 'João', 'Nayara'],
      },
    ];

    List<String> respostas = pergutas[_perguntaSelecionada]['respostas'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Questao(pergutas[_perguntaSelecionada]['texto']),
              ...respostas.map((t) => Resposta(t, _responder)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PerguntaAppState();
  }
}
