import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_notes_app/src/model/notesModel.dart';
import 'package:local_notes_app/src/views/create_note.dart';

class NotesGridile extends StatelessWidget {
  final NotesModel notes;

  const NotesGridile({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateNote(
                  note: notes,
                )));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.zero,
      color: Colors.white,
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notes.title,
                    style: GoogleFonts.poppins(fontSize: 18),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text(
                      notes.description,
                      style: GoogleFonts.poppins(),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
