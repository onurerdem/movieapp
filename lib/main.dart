import 'package:flutter/material.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movieapp/presentation/pages/popular_movies_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
        child: const PopularMoviesScreen(),
      ),
    );
  }
}
