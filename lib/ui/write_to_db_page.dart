import 'package:flutter/material.dart';
import 'package:notes_sqflite/data/model/note_model.dart';
import 'package:notes_sqflite/ui/all_notes_page.dart';
import 'package:notes_sqflite/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

class WriteToDb extends StatelessWidget {
  const WriteToDb({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController noteCtrl = TextEditingController();
    TextEditingController dateCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Write to DB"),
        actions: [
          IconButton(onPressed: (){
            context.read<NotesViewModel>().readNotes();
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNotesPage()));
          }, icon:Icon(Icons.read_more))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: noteCtrl,
              decoration: const InputDecoration(
                label: Text("Note"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24,),
            TextField(
              controller: dateCtrl,
              decoration: const InputDecoration(
                label: Text("Date"),
                border: OutlineInputBorder(),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          print("Bosildi");
          context.read<NotesViewModel>().addNote(NoteModel(note: noteCtrl.text, date: dateCtrl.text));

        },
      ),
    );
  }
}
