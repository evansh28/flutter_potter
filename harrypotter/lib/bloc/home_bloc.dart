import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrypotter/bloc/home_event.dart';
import 'package:harrypotter/bloc/home_state.dart';
import 'package:harrypotter/data/service/api_service.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService _characterService;

  CharacterBloc(this._characterService) : super(CharacterInitial()) {
    on<LoadCharacters>(_onLoadCharacters);
    on<LoadCharacterDetails>(_onLoadCharacterDetails);
  }

  void _onLoadCharacters(LoadCharacters event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    try {
      final characters = await _characterService.fetchCharacters();
      emit(CharacterLoaded(characters: characters));
    } catch (e) {
      emit(CharacterError(message: "Failed to fetch characters"));
    }
  }

  void _onLoadCharacterDetails(LoadCharacterDetails event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    try {
      final character = await _characterService.fetchCharacterDetail(event.index);
      emit(CharacterDetailLoaded(character: character));
    } catch (e) {
      emit(CharacterError(message: "Failed to fetch character details"));
    }
  }
}
