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
  final List<String> options = [
    "pedra",
    "papel",
    "tesoura",
  ];
  String optionRandom = 'padrao';
  String message = 'Escolha uma das opções:';
  Color messageVariant = Colors.black;
  int drawAttempts = 0;
  int okAttempts = 0;
  int failAttempts = 0;

  newTry(String option) {
    int index = Random(DateTime.now().microsecond).nextInt(3);
    optionRandom = options[index];

    if (option == optionRandom) {
      setState(() {
        message = 'Vocês empataram! :|';
        messageVariant = Colors.black;
        drawAttempts++;
      });
    } else {
      if (option == 'pedra' && optionRandom == 'papel') {
        setState(() {
          message = 'Você infelizmente perdeu... :(';
          messageVariant = Colors.redAccent;
          failAttempts++;
        });
      } else if (option == 'pedra' && optionRandom == 'tesoura') {
        setState(() {
          message = 'Você venceu! :D';
          messageVariant = Colors.lightGreen;
          okAttempts++;
        });
      } else if (option == 'papel' && optionRandom == 'tesoura') {
        setState(() {
          message = 'Você infelizmente perdeu... :(';
          messageVariant = Colors.redAccent;
          failAttempts++;
        });
      } else if (option == 'papel' && optionRandom == 'pedra') {
        setState(() {
          message = 'Você venceu! :D';
          messageVariant = Colors.lightGreen;
          okAttempts++;
        });
      } else if (option == 'tesoura' && optionRandom == 'pedra') {
        setState(() {
          message = 'Você infelizmente perdeu... :(';
          messageVariant = Colors.redAccent;
          failAttempts++;
        });
      } else if (option == 'tesoura' && optionRandom == 'papel') {
        setState(() {
          message = 'Você venceu! :D';
          messageVariant = Colors.lightGreen;
          okAttempts++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                  'Emp: $drawAttempts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Ace: $okAttempts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.lightGreen,
                  ),
                ),
                Text(
                  'Err: $failAttempts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            Text(
              'Escolha do Aplicativo:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Icone(imagePath: 'images/$optionRandom.png'),
            Text(
              message,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: messageVariant,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var option in options) GestureDetector(
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