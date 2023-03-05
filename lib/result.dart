import 'choices/player_choice.dart';
import 'choices/app_choice.dart';


String Game(final choiceApp, final choicePlayer){
  if(choicePlayer == null || choiceApp == null){
    return '';
  }
  else if(choicePlayer == choiceApp){
    return 'Empate' ;
  }
  else if(
  (choicePlayer == PlayPlayer.pedra && choiceApp == Play.tesoura)||
      (choicePlayer == PlayPlayer.papel && choiceApp == Play.pedra) ||
      (choicePlayer == PlayPlayer.tesoura && choiceApp == Play.papel)
  ){
    return 'Ganhou';
  }
  else{
    return 'Perdeu';
  }
}