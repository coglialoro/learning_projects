import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/routes.dart';
import 'package:provider/provider.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({required this.note, required this.index});

  final String note;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: Text(note)),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(RouteGenerator.editPage, arguments: index);
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              final provider = Provider.of<Notes>(context, listen: false);
              provider.removeNote(index);
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
