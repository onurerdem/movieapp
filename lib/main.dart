import 'package:flutter/material.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movieapp/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:movieapp/presentation/pages/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
          ),
          BlocProvider(
            create: (context) => getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}