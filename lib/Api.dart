
import 'dart:async';
import 'dart:convert';

import 'package:movie_app/constants.dart';
import 'package:movie_app/movies.dart';
import 'package:http/http.dart' as http;
class Api{
  static const trending_url='https://api.themoviedb.org/3/movie/popular?api_key=${constants.apikey}';
  static const topRatedUrl ='https://api.themoviedb.org/3/movie/top_rated?api_key=${constants.apikey}';
  static const upcomingUrl ='https://api.themoviedb.org/3/movie/upcoming?api_key=${constants.apikey}';
  Future<List<Movie>> getTrendingMovies() async{
    final response =await http.get(Uri.parse(trending_url));
    if(response.statusCode==200){
      final decodedData =json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('something happened');
    }
  }
  Future<List<Movie>> gettopRated() async{
    final response =await http.get(Uri.parse(topRatedUrl));
    if(response.statusCode==200){
      final decodedData =json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('something happened');
    }
  }

  Future<List<Movie>> getupComing() async{
    final response =await http.get(Uri.parse(upcomingUrl));
    if(response.statusCode==200){
      final decodedData =json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('something happened');
    }
  }
}