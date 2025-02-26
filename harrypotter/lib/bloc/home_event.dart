import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCharacters extends CharacterEvent {}

class LoadCharacterDetails extends CharacterEvent {
  final int index;

  LoadCharacterDetails({required this.index});

  @override
  List<Object> get props => [index];
}
