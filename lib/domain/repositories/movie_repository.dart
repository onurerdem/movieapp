import 'package:dartz/dartz.dart';
import 'package:movieapp/core/errors/server_failure.dart';
import 'package:movieapp/domain/entities/movie.dart';

abstract class MovieRepository{
  Future<Either<Failure,List<Movie>>> getTrendingMovies();
  Future<Either<Failure,List<Movie>>> searchMovies(String query);
  Future<Either<Failure,List<Movie>>> getPopularMovies();
}