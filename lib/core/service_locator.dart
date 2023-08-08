import 'package:anywhere_code_exercise/features/character_viewer/data/data_sources/characters_from_remote_data_source.dart';
import 'package:anywhere_code_exercise/features/character_viewer/domain/usecases/get_characters_usecase.dart';
import 'package:get_it/get_it.dart';

import '../features/character_viewer/data/repositories_impl/characters_repository_impl.dart';
import '../features/character_viewer/domain/repository_contracts/characters_repository_contract.dart';
import 'services/characters_services/character_service.dart';
final GetIt serviceLocator = GetIt.instance;

void setUpServices(){
  serviceLocator.registerSingleton<CharactersApiServiceContract>(CharactersApiServiceImpl());
  serviceLocator.registerSingleton<CharactersFromRemoteDataSourceContract>(CharactersFromRemoteDataSourceImpl());
  serviceLocator.registerSingleton<CharactersRepositoryContract>(CharactersRepositoryImpl());
  serviceLocator.registerSingleton<GetCharactersUseCase>(GetCharactersUseCase());

}