import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scribble_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:scribble_notes_app/models/note_model.dart';
import 'package:scribble_notes_app/widgets/custom_note_item.dart';
import 'package:scribble_notes_app/widgets/no_notes.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>? notes = BlocProvider.of<NotesCubit>(context).notes;

        if (notes == null || notes.isEmpty) {
          return const NoNotes();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomNoteItem(
                  note: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
