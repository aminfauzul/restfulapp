import 'package:restfulapp/data/models/album.dart';
import 'package:restfulapp/data/repository.dart';

class AlbumStore {
  final DataRepository _dataRepository;

  AlbumStore(this._dataRepository);

  Album _album;
  Album get album => _album;

  void getAlbum(int id) async {
    _album = await _dataRepository.fetchAlbum(id);
  }

  void downloadAlbum() async {
    _dataRepository.downloadAlbum();
  }
}