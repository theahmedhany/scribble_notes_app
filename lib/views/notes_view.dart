import 'package:flutter/material.dart';
import 'package:scribble_notes_app/constants.dart';
import 'package:scribble_notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:scribble_notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          size: 35,
          color: kSecondaryColor,
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}
