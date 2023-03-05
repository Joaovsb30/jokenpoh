import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jokenpoh/result.dart';
import 'choices/app_choice.dart';
import 'choices/player_choice.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  int wins = 0; //implementar wins, loses e reset
  int loses = 0;
  String? playerPlay;
  String? appPlay;

@override
  Widget build(BuildContext context) {

    ColorScheme tema = Theme.of(context).colorScheme.copyWith(
      primary: Colors.black
    );

    String? _result = Game(appPlay, playerPlay);

    print(_result);

    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black,
            primary: Colors.blueGrey,
            background: Colors.amber
          ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Pedra, Papel, Tesoura')),
        body: Container(
          decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Text('Escolha App:', style: TextStyle(
                  color: tema.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ) 
                ,textAlign: TextAlign.center,),
              SizedBox(height: 10),
              CircleAvatar(child: appPlay == null ? SizedBox() :
              Image.asset('images/$appPlay.png'),radius: 65, backgroundColor: Colors.black,),
              SizedBox(height: 10),
              Image.asset('images/vs.png', height: 70,),
              SizedBox(height: 10),
              Text('Escolha Jogador:', style: TextStyle(
                  color: tema.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )
                ,textAlign: TextAlign.center,),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      appPlay = getAppChoice();
                      playerPlay = PlayPlayer.pedra;
                    }),
                    child: CircleAvatar(child: Image.asset('images/pedra.png'),
                      radius: 50, backgroundColor: Colors.black,),
                  ),
                  GestureDetector(
                  onTap: () => setState(() {
                  appPlay = getAppChoice();
                  playerPlay = PlayPlayer.papel;
                  }),
                    child: CircleAvatar(child: Image.asset('images/papel.png'),
                      radius: 50, backgroundColor: Colors.black,),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      appPlay = getAppChoice();
                      playerPlay = PlayPlayer.tesoura;
                    }),
                    child: CircleAvatar(child: Image.asset('images/tesoura.png'),
                      radius: 50, backgroundColor: Colors.black,),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                child: _result == '' ? SizedBox() : Column(
                  children: [
                    Image.asset(_result == 'Ganhou'? 'images/teemoVictory.png' : 'images/amumuLoser.png', height: 120,),
                    Text(
                      _result, style: TextStyle(
                        color: tema.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    )
                      ,textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          ),
        ) ,
      ),
    );
  }
}