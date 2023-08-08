part of 'character_viewer_bloc.dart';

abstract class CharacterViewerState extends Equatable {
  const CharacterViewerState();
}

class CharacterViewerInitial extends CharacterViewerState {
  @override
  List<Object> get props => [];
}

class CharactersFoundState extends CharacterViewerState {
  final List<CharacterEntity> characters;
  const CharactersFoundState({required this.characters});
  @override
  List<Object> get props => [];
}

class CharacterViewerLoadingState extends CharacterViewerState {
  @override
  List<Object> get props => [];
}

class CharacterErrorState extends CharacterViewerState {
  final error;
  const CharacterErrorState({required this.error});

  @override
  List<Object?> get props => [];
}

class CharactersNotFoundState extends CharacterViewerState {
  final String message;
  const CharactersNotFoundState({required this.message});
  @override
  List<Object?> get props => [];
}
