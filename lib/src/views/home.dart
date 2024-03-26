import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_notes_app/src/model/notesModel.dart';
import 'package:local_notes_app/src/res/strings.dart';
import 'package:local_notes_app/src/services/local_db.dart';
import 'package:local_notes_app/src/views/create_note.dart';
import 'package:local_notes_app/src/views/notes_grid.dart';
import 'package:local_notes_app/src/views/notes_list.dart';
import 'package:local_notes_app/src/widgets/no_files_found.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.APP_NAME,
                    style: GoogleFonts.poppins(fontSize: 24),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isListView = !isListView;
                        });
                      },
                      icon: Icon(isListView
                          ? Icons.splitscreen_outlined
                          : Icons.grid_view))
                ],
              ),
            ),
            // const NoFilesFound()

            Expanded(
              child: StreamBuilder<List<NotesModel>>(
                  stream: LocalDBServices().getAllNotes(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const NoFilesFound();
                    } else {
                      final notesList = snapshot.data!;
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child: isListView
                            ? NotesList(notesList: notesList)
                            : NotesGrid(notesList: notesList),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateNote()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
