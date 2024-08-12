import 'package:flutter_mentor_project/exports.dart';

final class AlbumProvider extends ChangeNotifier {
  final AlbumRepositoryImpl _repo = AlbumRepositoryImpl();
  final MockAlbumRepositoryImpl _mockRepo = MockAlbumRepositoryImpl();
  StreamHolder<List<Album>?> listOfAlbum = StreamHolder<List<Album>?>(null);
  String _searchQuery = '';


  void loadAlbums() async {
    try {
      var result = await _repo.getAlbums();

      if (result != null) {
        listOfAlbum.addData(result);
      }
    } catch (e) {
      debugPrint('GET ALBUMS ERROR: $e');
    }

  }

  void loadMockAlbums() async {
    try {
      var result = await _mockRepo.getAlbums();

      if (result != null) {
        listOfAlbum.addData(result);
      }
    } catch (e) {
      debugPrint('GET ALBUMS ERROR: $e');
    }
  }

  set searchQuery(String value) {
    _searchQuery = value.toLowerCase();
    notifyListeners();
  }

  List<Album> filterAlbums(List<Album> albums) {
    if (_searchQuery.isEmpty) {
      return albums;
    }
    return albums.where((album) {
      final title = album.title.toLowerCase();
      final id = album.id.toString().toLowerCase();
      final userId = album.userId.toString().toLowerCase();
      return title.contains(_searchQuery) || id.contains(_searchQuery) || userId.contains(_searchQuery);
    }).toList();
  }
}

