import 'dart:convert';

import 'package:anywhere_code_exercise/config_flavors.dart';
import 'package:http/http.dart' as http;

abstract class CharactersApiServiceContract {
  Future getCharacters(FlavorConfig config);
}

class CharactersApiServiceImpl implements CharactersApiServiceContract {
  @override
  Future<Map<String, dynamic>> getCharacters(FlavorConfig config) async {
    print("baseUrl: ${config.baseUrl}");
    final response = await http.get(Uri.parse(config.baseUrl!));
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      print("Status code: ${response.statusCode} ${response.reasonPhrase}");
      throw Exception("Status code: ${response.statusCode} ${response.reasonPhrase}");
    }
  }
}
