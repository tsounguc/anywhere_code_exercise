import 'dart:convert';
import 'package:anywhere_code_exercise/features/character_viewer/data/models/character_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final testCharacterModel = CharacterModel(
    firstUrl: "https://duckduckgo.com/Butchie",
    icon: CharacterIcon(
      height: "",
      url: "/i/44216db8.jpg",
      width: "",
    ),
    result:
        "<a href=\"https://duckduckgo.com/Butchie\">Butchie</a><br>Butchie is a fictional character on the HBO drama series The Wire, portrayed by S. Robert Morgan. A blind man, he runs an East-Side Baltimore bar, and is Omar Little's bank and advisor. Like his character, actor S. Robert Morgan is blind; he lost his sight to macular degeneration in his twenties.",
    text:
        "Butchie - Butchie is a fictional character on the HBO drama series The Wire, portrayed by S. Robert Morgan. A blind man, he runs an East-Side Baltimore bar, and is Omar Little's bank and advisor. Like his character, actor S. Robert Morgan is blind; he lost his sight to macular degeneration in his twenties.",
  );

  group('fromJson', () {
    test("should return a valid Character model", () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('character.json'));
      final result = CharacterModel.fromJson(jsonMap);
      expect(result, equals(testCharacterModel));
    });
  });
}
