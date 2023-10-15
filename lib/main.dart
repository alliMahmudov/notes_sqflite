import 'package:flutter/material.dart';
import 'package:notes_sqflite/data/repository/note_repository.dart';
import 'package:notes_sqflite/service/local_db_service.dart';
import 'package:notes_sqflite/ui/write_to_db_page.dart';
import 'package:notes_sqflite/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => NotesViewModel(
          noteRepository: NoteRepository(
            db: LocalDatabase(),
          ),
        ),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WriteToDb(),
    );
  }
}
