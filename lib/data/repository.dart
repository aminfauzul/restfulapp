import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/album.dart';

abstract class Repository {
  Future<Album> fetchAlbum(int id);
  void downloadAlbum();
}

class DataRepository extends Repository {
  final Dio dio = Dio();

  @override
  Future<Album> fetchAlbum(int id) async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/albums/$id');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(response.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void downloadAlbum() async {
    String urlPath =
        "https://www.raspberrypi.org/app/uploads/2012/12/quick-start-guide-v1.1.pdf";
    if (await canLaunch(urlPath)) {
      await launch(urlPath);
    } else {
      throw 'Could not launch $urlPath';
    }
  }
}
