import 'package:flutter/material.dart';
import 'theme.dart';
import 'songs.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
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
            onPressed: ()=>{
              
            },
            color: Colors.black,
          ),
          new RaisedButton(
            child: new Text("Item 2"),
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
}







class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<StatefulWidget> {
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
                  // splashColor: lightAccentColor,
                  // highlightColor: lightAccentColor.withOpacity(0.5),
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


