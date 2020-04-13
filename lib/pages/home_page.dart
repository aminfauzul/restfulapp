import 'package:flutter/material.dart';
import 'package:restfulapp/states/album_store.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title, Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final albumRM = Injector.getAsReactive<AlbumStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESTful App"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildAlbum1Button(),
              buildAlbum2Button(),
              buildDownloadAlbumButton(),
              Text("Current album:"),
              buildAlbumMessage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAlbumMessage() {
    return StateBuilder<AlbumStore>(
      models: [albumRM],
      builder: (_, rm) {
        if (rm.isWaiting) {
          return CircularProgressIndicator();
        } else if (rm.hasData) {
          return Text("${rm.state.album.title}");
        }

        return Text("No data yet");
      },
    );
  }

  Widget buildDownloadAlbumButton() {
    return RaisedButton(
      onPressed: () {
        albumRM.value.downloadAlbum();
      },
      child: Text("Download PDF"),
    );
  }

  Widget buildAlbum2Button() {
    return RaisedButton(
      onPressed: () {
        albumRM.setState((store) => store.getAlbum(2));
      },
      child: Text("Get album 2"),
    );
  }

  Widget buildAlbum1Button() {
    return RaisedButton(
      onPressed: () {
        albumRM.setState((store) => store.getAlbum(1));
      },
      child: Text("Get album 1"),
    );
  }
}
