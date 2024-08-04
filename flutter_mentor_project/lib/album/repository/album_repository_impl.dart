import 'package:flutter_mentor_project/exports.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  @override
  Future<List<Album>?> getAlbums() async {
    final request = GetAlbumsRequest();

    try {
      final response = await request.send();
      if (response != null) {
        debugPrint(response.toString());
        return response;
      } else {
        print('Request failed with status: ${response.toString()}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
