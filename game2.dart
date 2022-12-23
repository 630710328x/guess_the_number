// ignore_for_file: avoid_print
import 'dart:math';

enum Guessresult {
  correct, tooHigh, tooLow
}

class Game{
  final int answer;

  int totalGuesses = 0;

  Game(int? maxRandom)
      : answer = Random().nextInt(maxRandom!) + 1 {
    //print('Answer is $answer');
  }

  Guessresult doGuess(int guess) {
    totalGuesses ++;

    if(guess > answer){
      return Guessresult.tooHigh;
    }
    else if(guess < answer){
      return Guessresult.tooLow;
    }
    else {
      return Guessresult.correct;
    }
  }

  int getTotalGuesses() {
    return totalGuesses;
  }

}