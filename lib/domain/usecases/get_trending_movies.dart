import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class GetTrendingMovies{
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getTrendingMovies();
  }
}