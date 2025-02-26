import 'dart:convert';
import 'package:harrypotter/data/models/home.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  final String _baseUrl = "https://potterapi-fedeperin.vercel.app/en/characters";

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load characters");
    }
  }

  Future<Character> fetchCharacterDetail(int index) async {
    final response = await http.get(Uri.parse("$_baseUrl?index=$index"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Character.fromJson(data);
    } else {
      throw Exception("Failed to load character details");
    }
  }
}
