import 'dart:convert';
import 'package:anywhere_code_exercise/features/character_viewer/data/models/character_model.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final testCharacterModel = CharacterModel(
    firstUrl: '',
    icon: CharacterIcon(
      height: '120',
      url: 'myurl.com',
      width: '120',
    ),
    result: 'From Cameroon',
    text: 'Christian Tsoungui ',
  );

  group('fromJson', () {
    test("should return a valid Character model", () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('character.json'));
      final result = CharacterModel.fromJson(jsonMap);
      expect(result, equals(testCharacterModel));
    });
  });
}
