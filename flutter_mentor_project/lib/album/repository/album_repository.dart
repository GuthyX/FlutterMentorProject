import 'package:flutter_mentor_project/exports.dart';

abstract class AlbumRepository {
  Future<List<Album>?> getAlbums();
}
