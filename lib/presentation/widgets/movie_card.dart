import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/util/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, () param1, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Ink.image(
          image: NetworkImage('${NETWORK_IMAGE}${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}