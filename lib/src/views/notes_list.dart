import 'package:auto_animated_list/auto_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:local_notes_app/src/model/notesModel.dart';
import 'package:local_notes_app/src/views/note_list_tile.dart';

class NotesList extends StatelessWidget {
  final List<NotesModel> notesList;

  const NotesList({super.key, required this.notesList});

  @override
  Widget build(BuildContext context) {
    return AutoAnimatedList<NotesModel>(
      padding: const EdgeInsets.all(20),
      itemBuilder: ((context, note, index, animation) {
        return SizeFadeTransition(
          animation: animation,
          child: NoteListTile(
            notes: note,
          ),
        );
      }),
      items: notesList,
    );
  }
}
