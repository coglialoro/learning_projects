import 'package:flutter/material.dart';
import 'package:notes/add_note.dart';
import 'package:notes/notes_list.dart';

class Home extends StatelessWidget {
  const Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddNote(),
          ),
          Expanded(child: NotesList()),
        ],
      ),
    );
  }
}
