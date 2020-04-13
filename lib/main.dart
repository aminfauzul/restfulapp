import 'package:flutter/material.dart';
import 'package:restfulapp/data/repository.dart';
import 'package:restfulapp/pages/home_page.dart';
import 'package:restfulapp/states/album_store.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Injector(
        inject: [Inject<AlbumStore>(() => AlbumStore(DataRepository()))],
        builder: (context) => HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
