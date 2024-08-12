import 'package:flutter_mentor_project/exports.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final albumProvider = Provider.of<AlbumProvider>(context, listen: false);
      albumProvider.loadAlbums();
    });
  }

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
                  provider.searchQuery = value;
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
                    albums = provider.filterAlbums(albums);
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
