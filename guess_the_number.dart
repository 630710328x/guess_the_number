// ignore_for_file: avoid_print

import 'dart:io';

import 'game2.dart';

void main() {
  var maxrandom = 0;
  var diff;
  var conti;
  var gameCount = 0;
  var scorePerGame = <int>[];

  print('╔═══════════════════ ❤ ═════════════════════');
  print('║     ▼ WELCOME TO GUESS THE NUMBER ▼');
  print('╟───────────────────────────────────────────');

  do {
    do {
      stdout.write('║   Select Level <Easy, Medium, Hard> : ');
      String input = stdin.readLineSync()!.toUpperCase();
      if (input == 'EASY' || input == 'MEDIUM' || input == 'HARD') {
        diff = input;
      } else {}
      if (diff == 'EASY') {
        maxrandom = 10;
      }

      else if (diff == 'MEDIUM') {
        maxrandom = 100;
      }

      else if (diff == 'HARD') {
        maxrandom = 1000;
      }
    }while(diff == null);

    var game = Game(maxrandom);
    Guessresult? result;
    do{
      stdout.write("║   Guess Number : ");
      String? input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      if(guess == null){
        print('║    Only Number!!!');

        continue;

      }

      result = game.doGuess(guess);
      if (result == Guessresult.correct) {
        print('║          ❤ Congratulations! ❤');
        print('║             ❤ YOU WIN !!! ❤');
      } else if (result == Guessresult.tooHigh) {
        print('║ $guess Is Too High');
      } else if (result == Guessresult.tooLow) {
        print('║ $guess Is Too Low');
      }


    }while(result != Guessresult.correct);


    do{
      stdout.write("║    ➜ Play Again? Y,N : ");
      String input = stdin.readLineSync()!.toUpperCase();
      if(input == 'Y' || input == 'N'){
        conti = input;
      }
    }while(conti == null);

    gameCount++;
    scorePerGame.add(game.totalGuesses);

  }while(conti == 'Y');

  print("║       ▼ You Have Play $gameCount Games ▼");

  for(var i = 0; i < scorePerGame.length; i++){
    print('║       ▲ game[${i + 1}] guess ${scorePerGame[i] } Times ▲');
  }

  print('║                 THE END ');
  print('╚═══════════════════ ❤ ══════════════════');
}