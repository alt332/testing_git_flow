import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../blocs/movie_provider.dart';
import '../blocs/movies_bloc.dart';

class MoviesList extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = MoviesProvider.of(context);

    bloc.fetchLatestMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Movies'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(MoviesBloc bloc) {
    return StreamBuilder(
      stream: bloc.movies,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => await bloc.fetchLatestMovies(),
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final movie = snapshot.data[index];
              return Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: movie.largeCoverImage,
                    placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${movie.rating}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
