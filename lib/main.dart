import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _options = [
    "pedra",
    "papel",
    "tesoura",
  ];
  String _optionRandom = 'padrao';
  String _message = 'Escolha uma das opções:';
  Color _messageVariant = Colors.black;
  int _drawAttempts = 0;
  int _okAttempts = 0;
  int _failAttempts = 0;

  newTry(String option) {
    int index = Random(DateTime.now().microsecond).nextInt(3);
    _optionRandom = _options[index];

    if (option == _optionRandom) {
      setState(() {
        _message = 'Vocês empataram! :|';
        _messageVariant = Colors.black;
        _drawAttempts++;
      });
    } else {
      if (
        (option == 'pedra' && _optionRandom == 'papel') ||
        (option == 'papel' && _optionRandom == 'tesoura') ||
        (option == 'tesoura' && _optionRandom == 'pedra')
      ) {
        setState(() {
          _message = 'Você infelizmente perdeu... :(';
          _messageVariant = Colors.redAccent;
          _failAttempts++;
        });
      } else if (
        (option == 'pedra' && _optionRandom == 'tesoura') ||
        (option == 'papel' && _optionRandom == 'pedra') ||
        (option == 'tesoura' && _optionRandom == 'papel')
      ) {
        setState(() {
          _message = 'Você venceu! :D';
          _messageVariant = Colors.lightGreen;
          _okAttempts++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JokenPo - @gilmarodp',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Emp: $_drawAttempts',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Ace: $_okAttempts',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.lightGreen,
                  ),
                ),
                Text(
                  'Err: $_failAttempts',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            const Text(
              'Escolha do Aplicativo:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Icone(imagePath: 'images/$_optionRandom.png'),
            Text(
              _message,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: _messageVariant,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var option in _options) GestureDetector(
                  onTap: () => newTry(option),
                  child: Icone(imagePath: 'images/$option.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Icone extends StatefulWidget {
  final String _imagePath;
  
  const Icone({super.key, required String imagePath}) : _imagePath = imagePath;

  @override
  State<Icone> createState() => _IconeState();
}

class _IconeState extends State<Icone> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Colors.black26,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
        child: Image.asset(widget._imagePath),
      ),
    );
  }
}