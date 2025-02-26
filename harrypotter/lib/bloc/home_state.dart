import 'package:equatable/equatable.dart';
import 'package:harrypotter/data/models/home.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded({required this.characters});

  @override
  List<Object> get props => [characters];
}

class CharacterDetailLoaded extends CharacterState {
  final Character character;

  CharacterDetailLoaded({required this.character});

  @override
  List<Object> get props => [character];
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError({required this.message});

  @override
  List<Object> get props => [message];
}
