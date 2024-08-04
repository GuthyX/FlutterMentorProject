import 'package:flutter_mentor_project/exports.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    AlbumProvider provider = context.watch<AlbumProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Album oldal'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Keresés',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: StreamHolderBuilder<List<Album>?>(
              streamHolder: provider.listOfAlbum,
              builder: (context, state, body, error) {
                switch (state) {
                  case StreamHolderState.none:
                    return Text('loading');
                  case StreamHolderState.hasError:
                    return const Text('Error');
                  case StreamHolderState.hasData:
                    var albums = provider.listOfAlbum.data ?? [];
                    if (_searchQuery.isNotEmpty) {
                      albums = albums.where((album) {
                        final title = album.title.toLowerCase();
                        final id = album.id.toString().toLowerCase();
                        final userId = album.userId.toString().toLowerCase();
                        return title.contains(_searchQuery) || id.contains(_searchQuery) || userId.contains(_searchQuery);
                      }).toList();
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return AlbumItem(album: albums[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemCount: albums.length,
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
