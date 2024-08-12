import 'package:flutter_mentor_project/exports.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  @override
  Future<List<Album>?> getAlbums() async {
    final request = GetAlbumsRequest();
    final response = await request.send();
    return response;
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

class MockAlbumRepositoryImpl extends AlbumRepository {
  @override
  Future<List<Album>?> getAlbums() async {
    await Future.delayed(const Duration(seconds: 5));

    List<Album> albums = [
      Album(userId: 1, id: 1, title: 'Test 1'),
      Album(userId: 1, id: 2, title: 'Test 2'),
      Album(userId: 1, id: 3, title: 'Test 3'),
      Album(userId: 2, id: 1, title: 'Test 4'),
    ];
    return albums;
  }
}

class DioAlbumRepositoryImpl extends AlbumRepository {
  final dio = Dio();
  @override
  Future<List<Album>?> getAlbums() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/albums');
    List<dynamic> data = response.data as List<dynamic>;
    List<Album> albums = data.map((json) => Album.fromJson(json as Map<String, dynamic>)).toList();
    return albums;
  }
}