import 'package:flutter_mentor_project/exports.dart';

final class AlbumProvider extends ChangeNotifier {
  final AlbumRepositoryImpl _repo = AlbumRepositoryImpl();
  StreamHolder<String> searchQuery = StreamHolder<String>('');
  StreamHolder<List<Album>?> listOfAlbum = StreamHolder<List<Album>?>(null);

  void loadAlbums() async {
    var result = await _repo.getAlbums();

    if (result == false) {
      debugPrint('Nem sikerült betölteni');
    }
    listOfAlbum.addData(result);
  }
}

