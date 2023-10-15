import 'package:flutter/cupertino.dart';
import 'package:notes_sqflite/data/model/note_model.dart';
import 'package:notes_sqflite/data/repository/note_repository.dart';

class NotesViewModel extends ChangeNotifier{
  NoteRepository? noteRepository;
  NotesViewModel({required this.noteRepository});


  List<NoteModel>? notes;
  bool isLoading = false;

  void addNote(NoteModel note)async{
    noteRepository!.addNote(note);
  }

  void readNotes() async{
    loadingChanger();
    notes = await noteRepository!.readNote();
    loadingChanger();
  }

   void updateNote(NoteModel noteModel, String note) async{
    noteRepository!.updateNote(noteModel, note);
    readNotes();
  }
  void deleteNote(String note) async{
    noteRepository!.deleteNote(note);
    readNotes();
  }

  void loadingChanger(){
    isLoading != isLoading;
    notifyListeners();
  }

}