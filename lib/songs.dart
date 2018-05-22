import 'package:meta/meta.dart';

final demoPlaylist = new DemoPlayList(
  songs:[
    new DemoSong(
      audioUrl: 'https://api.soundcloud.com/tracks/434370309/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      albumArtUrl: 'https://i1.sndcdn.com/avatars-000312484264-af28qp-t200x200.jpg',
      songTitle: 'Perfect Saxophone',
      artist: 'Simon More',
    ),
    new DemoSong(
      audioUrl: 'https://api.soundcloud.com/tracks/402538329/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P',
      albumArtUrl: 'https://i1.sndcdn.com/avatars-000344712337-f6po4d-t120x120.jpg',
      songTitle: 'Simply',
      artist: 'Kumbor',
    ),
  ],
);

class DemoPlayList{
  final List<DemoSong> songs;

  DemoPlayList({
    @required this.songs,
  });
}

class DemoSong{
  final String audioUrl;
  final String albumArtUrl;
  final String songTitle;
  final String artist;

   DemoSong({
     @required this.audioUrl,
     @required this.albumArtUrl,
     @required this.songTitle,
     @required this.artist,
   });
}

