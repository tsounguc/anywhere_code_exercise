import 'package:anywhere_code_exercise/features/character_viewer/data/models/character_model.dart';
import 'package:anywhere_code_exercise/features/character_viewer/domain/entities/character_entity.dart';

class CharacterMapper {
  CharacterEntity mapModelToEntity(CharacterModel model) {
    return CharacterEntity(
      firstUrl: model.firstUrl,
      image: model.icon,
      title: model.text.substring(0, model.text.indexOf('-')).trim(),
      description: model.text.substring(model.text.indexOf('-') + 1),
    );
  }
}
