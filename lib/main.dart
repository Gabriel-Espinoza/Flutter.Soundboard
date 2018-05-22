import 'dart:async';
import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

void main() => runApp(new Botonera());

class Botonera extends StatefulWidget{
   @override
  _BotoneraState createState() => new _BotoneraState();
}

enum PlayerState { stopped, playing, paused }

class _BotoneraState extends State<Botonera>{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Music Player',
      theme: a,
      home: new GridView(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          new RaisedButton(
            child: new Image(image: new NetworkImage("https://www.mariowiki.com/images/8/8b/MarioPartyStarRushStar.png")),
            onPressed: ()=>_playAudio("star"),
            color: Colors.black,
          ),
          new RaisedButton(
            child: new Text("Item 1231"),
            onPressed: ()=>{},
          ),
          new RaisedButton(
            child: new Text("Item 3"),
            onPressed: ()=>{},
          ),
          new RaisedButton(
            child: new Text("Item 4"),
            onPressed: ()=>{},
          ),
          new RaisedButton(
            child: new Text("Item 5"),
            onPressed: ()=>{},
          ),
          new RaisedButton(
            child: new Text("Item 6"),
            onPressed: ()=>{},
          ),
        ],
      ),
    );
  }
  
  AudioPlayer apStar = new AudioPlayer();
  PlayerState psStar = PlayerState.stopped;
  Future<Null> _playAudio(String sound) async {
    if(psStar == PlayerState.playing){
      final result = apStar.pause();
      if(result == 1)
        psStar = PlayerState.paused;
    }
    else
    {
      final result = await apStar.play("https://api.soundcloud.com/tracks/434370309/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P");
      if (result == 1) 
        setState(() => psStar = PlayerState.playing);
    }
  }
}