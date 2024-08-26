import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scribble_notes_app/constants.dart';
import 'package:scribble_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:scribble_notes_app/models/note_model.dart';
import 'package:scribble_notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 20, left: 18),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  fontSize: 28,
                  color: kMainColor,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  note.subTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    color: kMainColor,
                  ),
                ),
              ),
              trailing: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: kMainColor.withOpacity(0.3),
                ),
                child: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: kSecondaryColor,
                      size: 23,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                note.date,
                style: const TextStyle(
                  fontSize: 16,
                  color: kMainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
