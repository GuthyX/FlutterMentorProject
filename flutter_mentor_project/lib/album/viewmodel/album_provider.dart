import 'package:flutter_mentor_project/exports.dart';

final class AlbumProvider extends ChangeNotifier {
  final AlbumRepositoryImpl _repo = AlbumRepositoryImpl();
  StreamHolder<List<Album>?> listOfAlbum = StreamHolder<List<Album>?>(null);

  void loadAlbums() async {
    var result = await _repo.getAlbums();
    listOfAlbum.addData(result);
  }
}

