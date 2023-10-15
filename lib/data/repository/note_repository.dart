import 'package:notes_sqflite/data/model/note_model.dart';
import 'package:notes_sqflite/service/local_db_service.dart';

class NoteRepository{
  LocalDatabase? db;

  NoteRepository({required this.db});

  void addNote(NoteModel note) async => await db!.addNote(note);


  Future<List<NoteModel>> readNote() async {
    var result = await db!.getNotes();
    return result.map((e) => NoteModel.fromJson(e)).toList();
  }
  void updateNote(NoteModel noteModel, String note) async => await db!.updateNotes(noteModel, note);

  void deleteNote(String note) async => await db!.deleteNote(note);


}