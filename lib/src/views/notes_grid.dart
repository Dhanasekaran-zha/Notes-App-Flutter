import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:local_notes_app/src/model/notesModel.dart';
import 'package:local_notes_app/src/views/notes_grid_tile.dart';

class NotesGrid extends StatelessWidget {
  final List<NotesModel> notesList;

  const NotesGrid({super.key, required this.notesList});

  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index, animation) {
          return NotesGridile(notes: notesList[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemCount: notesList.length,
        options: const LiveOptions());
  }
}
