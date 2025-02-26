import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import 'character_detail.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (context.read<CharacterBloc>().state is! CharacterLoaded) {
      context.read<CharacterBloc>().add(LoadCharacters());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Harry Potter Characters')),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Container(child: Image.network(character.image, width: 50, height: 50, fit: BoxFit.cover,)),
                    title: Text(character.fullName),
                    subtitle: Text("Born: ${character.birthdate}"),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: context.read<CharacterBloc>(),
                            child: CharacterDetailScreen(index: character.index),
                          ),
                        ),
                      );

                      // Check if widget is still mounted before calling Bloc
                      if (mounted) {
                        context.read<CharacterBloc>().add(LoadCharacters());
                      }
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Failed to load characters"));
          }
        },
      ),
    );
  }
}