// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyNotesTile extends StatelessWidget {
  final String subject;
  final String note;
  const MyNotesTile({
    super.key,
    required this.note,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 88,
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            note,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
