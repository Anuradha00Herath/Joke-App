// services/api_service.dart
import '../models/joke.dart';
import 'mock_jokes.dart';

class ApiService {
  Future<List<Joke>> fetchJokes() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Return mock jokes
    return mockJokes;
  }
}
