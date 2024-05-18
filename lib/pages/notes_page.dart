import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/components/my_notestile.dart';
import 'package:notes/data/note_provider.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesProvider>().notes;
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
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
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
