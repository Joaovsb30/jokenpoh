import 'dart:math';

class Play{
  static const pedra = 'pedra';
  static const papel = 'papel';
  static const tesoura = 'tesoura';
}

String getAppChoice(){
  final random = Random();
  final plays = [Play.tesoura, Play.papel, Play.pedra];
  return plays[random.nextInt(plays.length)];
}
