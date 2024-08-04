import 'package:flutter_mentor_project/exports.dart';

class AlbumItem extends StatelessWidget {
  final Album? album;

  AlbumItem({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("UserID : ${album?.userId.toString()}"),
        Text(" ID : ${album?.id.toString()}"),
        Text("Title : ${album?.title}"),
      ],
    );
  }
}
