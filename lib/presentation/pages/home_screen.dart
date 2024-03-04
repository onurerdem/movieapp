import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:movieapp/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/search_movies/search_movies_state.dart';
import 'package:movieapp/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:movieapp/presentation/pages/movies_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  String searchText = '';

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintText: 'Search..'),
                ),
              )
            : const Text(
                'Home',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                  if (!isSearchClicked) {
                    _searchController.clear();
                  }
                });
              },
              icon: Icon(
                isSearchClicked ? Icons.close : Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Movies
              const Text(
                'Search Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                builder: (context, state) {
                  if (state is SearchMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is SearchMoviesLoaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is SearchMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

              const SizedBox(
                height: 20,
              ),
              // Trending Movies
              const Text(
                'Trending Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                builder: (context, state) {
                  if (state is TrendingMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is TrendingMoviesLoaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is TrendingMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

              const SizedBox(
                height: 20,
              ),
              // Popular Movies
              const Text(
                'Popular Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state) {
                  if (state is PopularMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is PopularMoviesLoaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is PopularMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
