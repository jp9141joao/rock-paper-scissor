import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _appImage = AssetImage('images/default.png');
  var _finalOutcome = "Good Lucky!!!";

  void _optionSelected(String userChoice) {
    var options = ['paper', 'rock', 'scissor'];
    var number = Random().nextInt(3);
    var systemChoice = options[number];

    switch (systemChoice) {
      case "paper":
        setState(() {
          _appImage = AssetImage("images/paper.png");
        });
        break;

      case "rock":
        setState(() {
          _appImage = AssetImage("images/rock.png");
        });
        break;

      case "scissor":
        setState(() {
          _appImage = AssetImage("images/scissor.png");
        });
        break;
    }

    if ((userChoice == "paper" && systemChoice == "paper") ||
        (userChoice == "rock" && systemChoice == "rock") ||
        (userChoice == "scissor" && systemChoice == "scissor")) {
      setState(() {
        _finalOutcome = "The game is a tie!";
      });
    } else if ((userChoice == "paper" && systemChoice == "scissor") ||
        (userChoice == "rock" && systemChoice == "paper") ||
        (userChoice == "scissor" && systemChoice == "rock")) {
      setState(() {
        _finalOutcome = "You lost!";
      });
    } else {
      setState(() {
        _finalOutcome = "You won!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text("App's Choise",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Image(image: _appImage),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Choose an option",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _optionSelected('paper'),
                child: const Image(
                    image: AssetImage("images/paper.png"), height: 100),
              ),
              GestureDetector(
                onTap: () => _optionSelected('rock'),
                child: const Image(
                    image: AssetImage("images/rock.png"), height: 100),
              ),
              GestureDetector(
                onTap: () => _optionSelected('scissor'),
                child: const Image(
                    image: AssetImage("images/scissor.png"), height: 100),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _finalOutcome,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
