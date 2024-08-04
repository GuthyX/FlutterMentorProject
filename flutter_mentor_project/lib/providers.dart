import 'package:flutter_mentor_project/exports.dart';

class Providers {
  Providers._();

  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<AlbumProvider>(create: (context) {
          final provider = AlbumProvider();
          provider.loadAlbums(); // Betölti az albumokat az alkalmazás elindulásakor
          return provider;
        },),
      ];
}
