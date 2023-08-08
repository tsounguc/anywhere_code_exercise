part of 'character_viewer_bloc.dart';

abstract class CharacterViewerEvent extends Equatable {
  const CharacterViewerEvent();
}

class GetCharactersEvent extends CharacterViewerEvent {
  final FlavorConfig? config;
  const GetCharactersEvent({this.config});
  @override
  List<Object?> get props => [];
}
