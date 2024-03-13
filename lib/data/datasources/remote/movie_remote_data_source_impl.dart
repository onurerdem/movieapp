import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/core/errors/server_exception.dart';
import 'package:movieapp/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/util/constants.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource{
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse(GET_POPULAR_MOVIES),
    );

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();
      return movies;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      Uri.parse(GET_TRENDING_MOVIES),
    );

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    }else{
      throw ServerException();
    }
  }

}