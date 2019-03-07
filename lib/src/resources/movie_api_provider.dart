import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import '../models/movie_model.dart';

class MovieApiProvider {
  Client client = Client();

  Future<List<MovieModel>> fetchLatestMovies({int page = 1}) async {
    final response =
        await client.get('https://yts.am/api/v2/list_movies.json?page=$page');

    if (response.statusCode == 200) {
      return compute(parseMovies, response.body);
    }

    return null;
  }
}

List<MovieModel> parseMovies(String responseBody) {
  final parsedJson = json.decode(responseBody);
  if (parsedJson['data'].containsKey('movies')) {
    final parsed = parsedJson['data']['movies'].cast<Map<String, dynamic>>();

    return parsed
        .map<MovieModel>((json) => new MovieModel.fromJson(json))
        .toList();
  } else {
    return new List();
  }
}
