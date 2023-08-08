import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:anywhere_code_exercise/core/service_locator.dart';
import 'package:anywhere_code_exercise/core/services/failures_successes/failures.dart';
import 'package:anywhere_code_exercise/features/character_viewer/domain/entities/character_entity.dart';

import '../repository_contracts/characters_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetCharactersUseCase {
  final CharactersRepositoryContract _charactersRepositoryContract =
      serviceLocator<CharactersRepositoryContract>();
  Future<Either<FetchCharactersFailure, List<CharacterEntity>>> getCharacters(FlavorConfig config) {
    return _charactersRepositoryContract.getCharacters(config);
  }
}
