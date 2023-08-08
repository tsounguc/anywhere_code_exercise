import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/services/failures_successes/failures.dart';
import '../entities/character_entity.dart';

abstract class CharactersRepositoryContract {
  Future<Either<FetchCharactersFailure, List<CharacterEntity>>> getCharacters(FlavorConfig config);
}
