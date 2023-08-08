import 'dart:async';

import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/service_locator.dart';
import '../../../../core/services/failures_successes/failures.dart';
import '../../domain/entities/character_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/usecases/get_characters_usecase.dart';

part 'character_viewer_event.dart';
part 'character_viewer_state.dart';

class CharacterViewerBloc extends Bloc<CharacterViewerEvent, CharacterViewerState> {
  final GetCharactersUseCase _getCharactersUseCase = serviceLocator<GetCharactersUseCase>();
  CharacterViewerBloc() : super(CharacterViewerInitial()) {
    on<GetCharactersEvent>((event, emit) async {
      emit(CharacterViewerLoadingState());
      final Either<FetchCharactersFailure, List<CharacterEntity>> charactersResults =
          await _getCharactersUseCase.getCharacters(event.config);
      charactersResults.fold(
        (fetchCharacterFailure) => emit(CharacterErrorState(error: fetchCharacterFailure.message)),
        (characters) {
          if (characters == null || characters.isEmpty) {
            emit(const CharactersNotFoundState(message: "No Character Found"));
          } else {
            emit(CharactersFoundState(characters: characters));
          }
        },
      );
    });
  }
}
