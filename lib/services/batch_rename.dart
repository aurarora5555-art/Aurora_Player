import '../models/song.dart';
import 'package:path/path.dart';

class RenameChange {
  final String oldPath;
  final String newPath;
  RenameChange(this.oldPath, this.newPath);
}

String applyPattern(Song s, String pattern) => pattern
    .replaceAll("\${artist}", s.artist)
    .replaceAll("\${album}", s.album)
    .replaceAll("\${track}", s.trackNo.toString().padLeft(2, '0'))
    .replaceAll("\${title}", s.title);

List<RenameChange> planRenames(List<Song> sel, String pattern) =>
    sel.map((s) {
      final newName = applyPattern(s, pattern);
      return RenameChange(
        s.path,
        join(dirname(s.path), "$newName${extension(s.path)}"),
      );
    }).toList();
