import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getPopularMovies();
  }
}