import 'dart:async';

import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'character_viewer_event.dart';
part 'character_viewer_state.dart';

class CharacterViewerBloc extends Bloc<CharacterViewerEvent, CharacterViewerState> {
  final GetCharactersUseCase _getCharactersUseCase = serviceLocator<GetCharacterUseCase>();
  CharacterViewerBloc() : super(CharacterViewerInitial()) {
    on<CharacterViewerEvent>((event, emit) async{
      emit(CharacterViewerLoadingState());
      final Either<FetchCharactersFailure, List<CharacterEntity>> charactersResults = await _getCharactersUseCase.getCharacter
    });
  }
}
