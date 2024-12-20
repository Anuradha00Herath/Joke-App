import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/joke.dart';

class SharedPreferencesHelper {
  static const String jokesKey = 'cachedJokes';

  Future<void> saveJokes(List<Joke> jokes) async {
    final prefs = await SharedPreferences.getInstance();
    final jokesJson = jokes.map((joke) => joke.toJson()).toList();
    prefs.setString(jokesKey, json.encode(jokesJson));
  }

  Future<List<Joke>> loadJokes() async {
    final prefs = await SharedPreferences.getInstance();
    final jokesJson = prefs.getString(jokesKey);
    if (jokesJson != null) {
      final List jokesList = json.decode(jokesJson);
      return jokesList.map((joke) => Joke.fromJson(joke)).toList();
    }
    return [];
  }
}
