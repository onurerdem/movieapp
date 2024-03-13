const BASE_URL = "https://api.themoviedb.org/3";
const API_KEY = "9014c6a841cb9a3178c2efad48f3673e";

const GET_POPULAR_MOVIES = "$BASE_URL/movie/popular?api_key=$API_KEY";
const GET_TRENDING_MOVIES = "$BASE_URL/trending/movie/day?api_key=$API_KEY";
const GET_TRENDING_MOVIES_WEEK = "$BASE_URL/trending/movie/week?api_key=$API_KEY";

const NETWORK_IMAGE = 'https://image.tmdb.org/t/p/w500/';