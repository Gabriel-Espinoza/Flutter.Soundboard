import 'package:flutter/material.dart';
import 'songs.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

class DiegoApp extends StatefulWidget {
  @override
  _DiegoAppState createState() => new _DiegoAppState();
}

class _DiegoAppState extends State<DiegoApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Audio(
      audioUrl: demoPlaylist.songs[0].audioUrl,
      playbackState: PlaybackState.paused,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('hola'),
        ),
        body: new Column(

          children: <Widget>[

            new Container(
              child: new Center(
                child: new Container(
                  width: 125.0,
                  height: 125.0,
                ),
              ),
            ),
            
            new AudioComponent(
              updateMe:[
                WatchableAudioProperties.audioPlayerState,
              ],
              playerBuilder: (BuildContext context, AudioPlayer player, Widget child)
              {
                Function onPressed;
                onPressed = player.play;
                if(player.state == AudioPlayerState.playing)
                {
                  onPressed = player.pause;
                } 
                else if (player.state == AudioPlayerState.paused || player.state == AudioPlayerState.completed)
                {
                  onPressed = player.play;
                }

                return new RawMaterialButton(
                  shape: new CircleBorder(),
                  fillColor: Colors.blue,
                  elevation: 10.0,
                  highlightElevation: 5.0,
                  onPressed: onPressed,

                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 35.0,
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}