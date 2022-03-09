import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  EditPage(this.index);

  final int index;
  late final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Notes>(context, listen: false);
    _controller = TextEditingController(text: provider.notes[index]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
      ),
      body: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              provider.editNote(index, _controller.text);
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}
