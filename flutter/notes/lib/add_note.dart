import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final provider = Provider.of<Notes>(context, listen: false);
            provider.addNote(_controller.text);
            _controller.clear();
          },
          child: Text("Add"),
        )
      ],
    );
  }
}
