import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';

class CharacterDetailScreen extends StatefulWidget {
  final int index;

  CharacterDetailScreen({required this.index});

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (mounted) {
      context.read<CharacterBloc>().add(LoadCharacterDetails(index: widget.index));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Character Details")),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CharacterDetailLoaded) {
            final character = state.character;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.network(character.image, height: 150)),
                  SizedBox(height: 10),
                  Text("Full Name: ${character.fullName}", style: TextStyle(fontSize: 18)),
                  Text("Nickname: ${character.nickname}", style: TextStyle(fontSize: 16)),
                  Text("House: ${character.house}", style: TextStyle(fontSize: 16)),
                  Text("Actor: ${character.interpretedBy}", style: TextStyle(fontSize: 16)),
                  Text("Birthdate: ${character.birthdate}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text("Children:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...character.children.map((child) => Text(" - $child")).toList(),
                ],
              ),
            );
          } else {
            return Center(child: Text("Failed to load details"));
          }
        },
      ),
    );
  }
}