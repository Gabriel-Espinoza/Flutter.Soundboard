import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audioplayers/audioplayer.dart';
import 'package:flutter/material.dart';

class Sound {
  String icon;
  String sound;
  bool shouldPlayOnGlobalInstance;

  Sound(String icon, String sound, bool shouldPlayOnGlobalInstance) {
    this.icon = icon;
    this.sound = sound;
    this.shouldPlayOnGlobalInstance = shouldPlayOnGlobalInstance;
  }
}

class SoundList{
  final assetsDir = "assets";
  final list = <Sound>[//posteriormente puedo llenarlo de algún lugar dinámico, como un archivo de configuración o algo así.
    new Sound("coin.png", "coin.mp3", false), 
    new Sound("star.png", "star.mp3", true), 
    new Sound("pipe.png", "pipe.mp3", false), 
    new Sound("bowser.png", "bowser.mp3", true), 
    new Sound("victory.png", "victory.mp3", true), 
    new Sound("dies.png", "dies.mp3", false), 
  ];

  List<RaisedButton> generateButtons(SoundsManager manager){
    List<RaisedButton> buttons = new List<RaisedButton>();
    for(final s in list)
    {
      final b = new RaisedButton(
            child: new Image(image: new AssetImage("$assetsDir/${s.icon}")),
            onPressed: ()=>manager.playSound(s),
            color: Colors.transparent,
          );
      buttons.add(b);
    }
    return buttons;
  }
}

class SoundsManager {

  final _sounds = new SoundList();
  final _audioPlayer = new AudioPlayer();

  var _alreadyCopied = false;

  Future playSound(Sound sound) async{
    await copySoundsToLocalDirectory();
    final path = await _getSoundPath(sound);
    if(sound.shouldPlayOnGlobalInstance)
      await _audioPlayer.play(path, isLocal: true);
    else {
      var ap = new AudioPlayer();
      ap.play(path, isLocal: true);

    }
  }

  Future copySoundsToLocalDirectory() async{

    if(_alreadyCopied)
      return;

    final localDir = await getApplicationDocumentsDirectory();

    for(final fileName in _sounds.list) {
      final localAssetFile = File('${localDir.path}/${fileName.sound}');
      final fileExists = await localAssetFile.exists();

      //if the file already exists, we must delete it in order to write a new one
      if(fileExists)
        await localAssetFile.delete();

      final data = await rootBundle.load('${_sounds.assetsDir}/${fileName.sound}');
      final bytes = data.buffer.asUint8List();
      await localAssetFile.writeAsBytes(bytes, flush: true);
    }

    _alreadyCopied = true;
  }

  Future<String> _getSoundPath(Sound sound) async {
    final localDir = await getApplicationDocumentsDirectory();
    return "${localDir.path}/${sound.sound}";
  }
}