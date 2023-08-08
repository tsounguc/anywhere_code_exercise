import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:anywhere_code_exercise/core/services/failures_successes/exceptions.dart';
import 'package:anywhere_code_exercise/core/services/failures_successes/failures.dart';
import 'package:anywhere_code_exercise/features/character_viewer/domain/entities/character_entity.dart';
import 'package:anywhere_code_exercise/features/character_viewer/domain/repository_contracts/characters_repository_contract.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/service_locator.dart';
import '../data_sources/characters_from_remote_data_source.dart';
import '../mappers/character_mapper.dart';

class CharactersRepositoryImpl implements CharactersRepositoryContract {
  CharactersFromRemoteDataSourceContract charactersFromRemoteDataSourceContract =
      serviceLocator<CharactersFromRemoteDataSourceContract>();
  @override
  Future<Either<FetchCharactersFailure, List<CharacterEntity>>> getCharacters(FlavorConfig config) async {
    try {
      var characterModelsList = await charactersFromRemoteDataSourceContract.getCharacters(config);

      CharacterMapper mapper = CharacterMapper();

      List<CharacterEntity> characterEntitiesList = [];

      for (int index = 0; index < characterModelsList.length; index++) {
        CharacterEntity characterEntity = mapper.mapModelToEntity(characterModelsList[index]);
        characterEntitiesList.add(characterEntity);
      }
      return Right(characterEntitiesList);
    } on FetchCharactersException catch (e) {
      return Left(FetchCharactersFailure(message: e.message));
    }
  }
}
