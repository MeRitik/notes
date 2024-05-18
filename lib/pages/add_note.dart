// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  void _saveNote() {}

  TextEditingController subjectController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        title: const Text("Add a new note"),
        backgroundColor: Colors.amber.shade200,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            child: GestureDetector(
              onTap: _saveNote,
              child: Icon(
                Icons.save,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                hintText: "Subject",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: "Enter your note...",
                  border: OutlineInputBorder(),
                ),
                expands: true,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
