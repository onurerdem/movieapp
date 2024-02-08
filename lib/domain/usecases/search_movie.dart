import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class SearchMovies{
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<List<Movie>> call(String query) async {
    return await repository.searchMovies(query);
  }
}