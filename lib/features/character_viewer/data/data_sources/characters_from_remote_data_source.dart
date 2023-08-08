import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:anywhere_code_exercise/core/service_locator.dart';
import 'package:anywhere_code_exercise/core/services/characters_services/character_service.dart';
import 'package:anywhere_code_exercise/core/services/failures_successes/exceptions.dart';
import 'package:flutter/material.dart';

import '../models/character_model.dart';

abstract class CharactersFromRemoteDataSourceContract {
  Future getCharacters(FlavorConfig config);
}

class CharactersFromRemoteDataSourceImpl implements CharactersFromRemoteDataSourceContract {
  final CharactersApiServiceContract charactersApiServiceContract = serviceLocator<CharactersApiServiceContract>();
  @override
  Future<List<CharacterModel>> getCharacters(FlavorConfig config) async {
    try {
      Map<String, dynamic> data = await charactersApiServiceContract.getCharacters(config);

      List charactersData = data['RelatedTopics'];
      print(charactersData.toString());

      List<Map<String, dynamic>> characterJsonObjectsList = [];

      for (int index = 0; index < charactersData.length; index++) {
        Map<String, dynamic> characterJsonObject = charactersData[index] as Map<String, dynamic>;
        characterJsonObjectsList.add(characterJsonObject);
      }

      debugPrint('${characterJsonObjectsList[3]}');

      List<CharacterModel> restaurantModelsList = [];

      for (int index = 0; index < characterJsonObjectsList.length; index++) {
        CharacterModel restaurantModel = CharacterModel.fromJson(characterJsonObjectsList[index]);
        restaurantModelsList.add(restaurantModel);
      }

      return restaurantModelsList;
    } catch (e) {
      throw const FetchCharactersException(message: "Failed to get list of characters");
    }
  }
}
