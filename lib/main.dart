import 'theme.dart';
import 'package:flutter/material.dart';
import 'SoundManager.dart';

void main() => runApp(new Botonera());

class Botonera extends StatefulWidget{
   @override
  _BotoneraState createState() => new _BotoneraState();
}

class _BotoneraState extends State<Botonera>{
  
  SoundsManager _soundsManager = new SoundsManager();
  SoundList _soundList = new SoundList();

  @override
  Widget build(BuildContext context){
    
    return new MaterialApp(
      theme: a,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Super Mario Gamer Soundboard"),
        ),
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            )
          ),
          child: new GridView(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: _soundList.generateButtons(_soundsManager),
          ),
        ),
      )
    );
  }
}