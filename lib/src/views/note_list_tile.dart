import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_notes_app/src/model/notesModel.dart';
import 'package:local_notes_app/src/views/create_note.dart';

class NoteListTile extends StatelessWidget {
  final NotesModel notes;

  const NoteListTile({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateNote(
                      note: notes,
                    )));
          },
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400, width: 2)),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notes.title,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                        maxLines: 1),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(notes.description,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis),
                  ],
                ))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
