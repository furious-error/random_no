import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(random());

class random extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess the Number',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Guess the Number'),
          centerTitle: true,
        ),
        body: RandomNumberGenerator(),
      ),
    );
  }
}

class RandomNumberGenerator extends StatefulWidget {
  @override
  RandomNumberGeneratorState createState() => RandomNumberGeneratorState();
}

class RandomNumberGeneratorState extends State<RandomNumberGenerator> {
  int random = 0;
  int guess = 0;
  String result ='';

  void generateRandomNumber() {
    setState(() {
      random = Random().nextInt(100) + 1;
    });
  }

  void isGuess(){
    setState((){
      if(guess == random){
        result = 'Correct Guess';
      }
      else if(guess < random){
        result = 'Guess is smaller than number';
      }
      else {
        result = 'Guess is greater than number';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Guess the number between 1 and 100',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            '$result',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                guess = int.tryParse(value) ?? 0;
              });
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: isGuess,
                child: const Text('Check Guess'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: generateRandomNumber,
                child: const Text('New Game'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
