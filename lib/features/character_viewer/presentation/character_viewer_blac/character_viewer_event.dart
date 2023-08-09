part of 'character_viewer_bloc.dart';

abstract class CharacterViewerEvent extends Equatable {
  const CharacterViewerEvent();
}

class GetCharactersEvent extends CharacterViewerEvent {
  final FlavorConfig config;
  const GetCharactersEvent({required this.config});
  @override
  List<Object?> get props => [];
}

class SearchCharacterEvent extends CharacterViewerEvent {
  final String? query;
  const SearchCharacterEvent({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
