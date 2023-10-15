import 'package:flutter/material.dart';
import 'package:notes_sqflite/data/model/note_model.dart';
import 'package:notes_sqflite/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatelessWidget {
  NoteModel note;
  NoteItem({required this.note, super.key});
  TextEditingController noteCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    noteCtrl.text = note.note;
    dateCtrl.text = note.date;
    return ListTile(
      onLongPress: (){
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        context.read<NotesViewModel>().deleteNote(note.note);
                        Navigator.pop(context);
                      },
                      child: const Text("Delete"))
                ],
                title: const Text("Are you sure you want to delete this note?", style: TextStyle(fontSize: 20),),
            )

        );
      },
      title: Text(note.note),
      subtitle: Text(note.date),
      trailing: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              context.read<NotesViewModel>().updateNote(
                                  NoteModel(
                                      note: noteCtrl.text, date: dateCtrl.text),
                                  note.note);
                              Navigator.pop(context);
                            },
                            child: const Text("Edit"))
                      ],
                      content: Container(
                        height: 160,
                        child: Column(
                          children: [
                            TextField(
                              controller: noteCtrl,
                              decoration: const InputDecoration(
                                label: Text("Note"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextField(
                              controller: dateCtrl,
                              decoration: const InputDecoration(
                                label: Text("Date"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ))

          );
        },
        icon: const Icon(Icons.edit),
        color: Colors.deepPurple[200],
      ),
    );
  }
}
