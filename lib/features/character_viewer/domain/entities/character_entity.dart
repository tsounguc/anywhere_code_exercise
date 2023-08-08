import '../../data/models/character_model.dart';

class CharacterEntity {
  String firstUrl;
  CharacterIcon image;
  String title;
  String description;
  CharacterEntity({
    required this.firstUrl,
    required this.image,
    required this.title,
    required this.description,
  });
}
