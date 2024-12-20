import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_service.dart';
import '../utils/shared_preferences_helper.dart';
import '../widgets/loading_widget.dart';
import 'joke_card.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  final ApiService _apiService = ApiService();
  final SharedPreferencesHelper _prefsHelper = SharedPreferencesHelper();
  List<Joke> jokes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadJokes();
  }

  Future<void> _loadJokes() async {
    try {
      final List<Joke> onlineJokes = await _apiService.fetchJokes();
      setState(() {
        jokes = onlineJokes;
        isLoading = false;
      });
      _prefsHelper.saveJokes(onlineJokes);
    } catch (error) {
      final List<Joke> cachedJokes = await _prefsHelper.loadJokes();
      setState(() {
        jokes = cachedJokes;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jokes')),
      body: isLoading
          ? const LoadingWidget()
          : jokes.isEmpty
              ? const Center(child: Text('No jokes available'))
              : ListView.builder(
                  itemCount: jokes.length,
                  itemBuilder: (context, index) => JokeCard(joke: jokes[index]),
                ),
    );
  }
}
