import 'dart:async';
import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../resources/movie_api_provider.dart';

class MoviesBloc {
  final movieApiProvider = MovieApiProvider();

  final _movies = StreamController<List<MovieModel>>();

  Stream<List<MovieModel>> get movies => _movies.stream;

  fetchLatestMovies() async {
    final latestMovies = await movieApiProvider.fetchLatestMovies();
    _movies.sink.add(latestMovies);
  }

  dispose() {
    _movies.close();
  }
}
