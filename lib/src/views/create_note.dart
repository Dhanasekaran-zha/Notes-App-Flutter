import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:local_notes_app/src/model/notesModel.dart';
import 'package:local_notes_app/src/services/local_db.dart';
import 'package:lottie/lottie.dart';
import '../res/assets.dart';

class CreateNote extends StatefulWidget {
  final NotesModel? note;

  const CreateNote({super.key, this.note});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final localdb = LocalDBServices();
  bool isDeletePressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    if (isDeletePressed) {
      Navigator.pop(context);
      isDeletePressed = false;
      return;
    }

    final title = _titleController.text;
    final description = _descriptionController.text;

    if (widget.note != null) {
      final newNote =
          widget.note!.copyWith(title: title, description: description);

      localdb.saveNotes(notes: newNote);
      return;
    }

    final newNote = NotesModel(
        id: Isar.autoIncrement,
        title: title,
        description: description,
        lastMod: DateTime.now());

    localdb.saveNotes(notes: newNote);

    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                widget.note != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Delete Note ?",
                                        style:
                                            GoogleFonts.poppins(fontSize: 20),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Lottie.asset(
                                              AnimationAssets.deleteAnimation),
                                          Text(
                                            "This note will be permanentely deleted.",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              isDeletePressed = true;
                                              Navigator.pop(context);
                                              LocalDBServices().deleteNote(
                                                  Id: widget.note!.id);
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Delete",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.red),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Cancel",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ))
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(Icons.delete)),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Title"),
                style: GoogleFonts.poppins(fontSize: 24),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 9999,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Description"),
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
