import 'package:flutter/material.dart';
import './blocs/movie_provider.dart';
import './screens/movies_list.dart';

class Fovie extends StatelessWidget {
  Widget build(BuildContext context) {
    return MoviesProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: MoviesList(),
      ),
    );
  }
}
