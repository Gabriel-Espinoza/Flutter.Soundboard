import 'dart:async';
import 'theme.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  
  AudioPlayer _coinPlayerCoin = new AudioPlayer();
  PlayerState _coinState = PlayerState.stopped;
  Future<Null> _playAudio(String sound) async {

    final bleh = await _copyLocalAssets();
    final result = await _coinPlayerCoin.play(bleh, isLocal: true);
  }



   Future<String> _copyLocalAssets() async {
    final bundleDir = 'assets/audio';
    final filename = 'coin.wav';
    final localDir = await getApplicationDocumentsDirectory();
    final localAssetFile1 = await _copyLocalAsset(localDir, bundleDir, filename);
    final finalpath = localAssetFile1.path;
    return finalpath;
  }

  Future<File> _copyLocalAsset(Directory localDir, String bundleDir, String assetName) async {
    final data = await rootBundle.load('$bundleDir/$assetName');
    final bytes = data.buffer.asUint8List();
    final localAssetFile = File('${localDir.path}/$assetName');
    final fileExists = await localAssetFile.exists();
    if(!fileExists)
    {
      await localAssetFile.writeAsBytes(bytes, flush: true);
    }
    return localAssetFile;
  }
}