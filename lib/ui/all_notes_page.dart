import 'package:flutter/material.dart';
import 'package:notes_sqflite/ui/widgets/note_item.dart';
import 'package:notes_sqflite/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

class AllNotesPage extends StatelessWidget {
  const AllNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text("All Notes"),
      ),
      body: Consumer<NotesViewModel>(
        builder: (context, value, child) {
          if(value.notes==null){
          //  context.read<NotesViewModel>().readNotes();
          }else if (value.isLoading){
            return const Center(child: CircularProgressIndicator(),);
          } else {
            return ListView.builder(
                itemCount: value.notes!.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
              var note = value.notes![index];
              return NoteItem(note: note);
            });
          }
          return Container();
        },
      ),
    );
  }
}
