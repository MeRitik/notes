import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/components/my_notestile.dart';
import 'package:notes/data/note_class.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Note> _notes = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => FirebaseAuth.instance.signOut(),
            child: const Icon(Icons.logout_sharp),
          ),
        ],
        backgroundColor: Colors.blueGrey.shade100,
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return MyNotesTile(
            subject: note.title,
            note: note.content,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          '/add_note',
        ),
        child: const Icon(
          Icons.note_alt_sharp,
        ),
      ),
    );
  }
}
