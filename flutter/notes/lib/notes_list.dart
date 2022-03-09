import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/note_tile.dart';
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Notes>(context);
    final notes = provider.notes;
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteTile(
          note: notes[index],
          index: index,
        );
      },
    );
  }
}
