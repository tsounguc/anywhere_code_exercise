part of 'character_viewer_bloc.dart';

abstract class CharacterViewerState extends Equatable {
  const CharacterViewerState();
}

class CharacterViewerInitial extends CharacterViewerState {
  @override
  List<Object> get props => [];
}

class CharacterViewerLoadingState extends CharacterViewerState {
  @override
  List<Object> get props => [];
}
