import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/data/note_class.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    _fetchNotes();
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> _fetchNotes() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('UserData').get();
      _notes = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Note(
          title: data['subject'],
          content: data['note'],
        );
      }).toList();
    } catch (e) {
      print('Error fetching notes: $e');
    }

    if (_notes.isEmpty) {
      _initialNotes();
    }
  }

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void removeNoteAt(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void _initialNotes() {
    _notes = [
      Note(title: 'MyNotes', content: 'Welcome to My Notes app.'),
    ];
  }
}
