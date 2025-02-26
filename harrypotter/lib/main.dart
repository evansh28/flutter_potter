import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrypotter/bloc/home_bloc.dart';
import 'package:harrypotter/bloc/home_event.dart';
import 'package:harrypotter/data/service/api_service.dart';
import 'package:harrypotter/presentation/screens/character_list.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CharacterBloc(CharacterService())..add(LoadCharacters()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CharacterListScreen(),
    );
  }
}


