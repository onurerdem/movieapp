import 'package:get_it/get_it.dart';
import 'package:movieapp/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_popular_movies.dart';
import 'package:movieapp/domain/usecases/get_trending_movies.dart';
import 'package:movieapp/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => http.Client());

}