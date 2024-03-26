import 'package:isar/isar.dart';
import 'package:local_notes_app/src/model/notesModel.dart';

class LocalDBServices {
  late Future<Isar> db;

  LocalDBServices() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [NotesModelSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveNotes({required NotesModel notes}) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.notesModels.putSync(notes));
  }

  Stream<List<NotesModel>> getAllNotes() async* {
    final isar = await db;
    yield* isar.notesModels.where().watch(fireImmediately: true);
  }

  void deleteNote({required int Id}) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.notesModels.deleteSync(Id));
  }
}
