abstract class CharactersApiServiceContract {
  Future getCharacters();
}
class SimpsonsCharactersApiServiceImpl implements CharactersApiServiceContract{
  final _url =
  @override
  Future<Map<String, dynamic>> getCharacters() {
    final response = await http.get(Uri.parse(uri))
    // TODO: implement getCharacters
    throw UnimplementedError();
  }

}