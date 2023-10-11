// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mid_level/models/movies_model.dart';
import 'package:flutter_mid_level/utils/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class HomeController extends GetxController{   
     ScrollController scroll_controller=ScrollController();
 
    Future<List<MovieModel>> getTrendMovies()async{
      var respons=await http.get(Uri.parse("${Constant.trengMoviesUrl}?api_key=${Constant.apiKey}")); 
     if(respons.statusCode==200){
        var data=json.decode(respons.body)['results'] as List;
        print("==========================================================");
        print(data);
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
     }
     else{
      throw Exception('Something happened');
     }
    }

    Future<List<MovieModel>> getPopularMovies()async{
      var respons=await http.get(Uri.parse("${Constant.popularMoviesUrl}?api_key=${Constant.apiKey}")); 
     if(respons.statusCode==200){
        var data=json.decode(respons.body)['results'] as List;
        print("==========================================================");
        print(data);
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
     }
     else{
      throw Exception('Something happened');
     }
    }


    Future<List<MovieModel>> getUpCommingMovies()async{
      var respons=await http.get(Uri.parse("${Constant.upCommingMoviesUrl}?api_key=${Constant.apiKey}")); 
     if(respons.statusCode==200){
        var data=json.decode(respons.body)['results'] as List;
        print("==========================================================");
        print(data);
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
     }
     else{
      throw Exception('Something happened');
     }
    }

    Future<List<MovieModel>> getTopRatedMovies()async{
      var respons=await http.get(Uri.parse("${Constant.topRatedMoviesUrl}?api_key=${Constant.apiKey}")); 
     if(respons.statusCode==200){
        var data=json.decode(respons.body)['results'] as List;
        print("==========================================================");
        print(data);
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
     }
     else{
      throw Exception('Something happened');
     }
    }


Future<List<MovieModel>> discoverMovies()async{
      var respons=await http.get(Uri.parse("${Constant.discoverMoviesUrl}?api_key=${Constant.apiKey}")); 
     if(respons.statusCode==200){
        var data=json.decode(respons.body)['results'] as List;
        print("==========================================================");
        print(data);
        return data.map((movie) => MovieModel.fromJson(movie)).toList();
     }
     else{
      throw Exception('Something happened');
     }
    }
  


void scrollListener(){
  if(scroll_controller.offset<=scroll_controller.position.minScrollExtent){
    update();
  }
}
}