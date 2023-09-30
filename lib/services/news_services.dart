import 'dart:math';

import 'package:dio/dio.dart';
import 'package:news_app/model/lower_model.dart';

class NewsServics{

final dio = Dio();

Future<List<LowerNewsModel>> getgeneralnews() async {
  Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=e58739624dae4cb5b62c960eb8e8b4ed ');
 Map<String,dynamic> jsonData = response.data;
 List<dynamic> articles =jsonData['articles'];
 List<LowerNewsModel> articleslist=[];
  for (var element in articles) {
    LowerNewsModel lowerNewsMode = LowerNewsModel(
      image: element['urlToImage'], 
      url: element['url'], 
      author: element['author'], 
      title: element['title'], 
      description: element['description'], 
      content: element['content']);
      articleslist.add(lowerNewsMode);
      }
      List<String> randomStrings = generateRandomStrings(articleslist.length);
      for(int i=0; i<articleslist.length;i++){
        articleslist[i].tag=randomStrings[i];
      }
      return articleslist;
    }

    Future<List<LowerNewsModel>> getspecificnews(String category) async {
  Response response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=e58739624dae4cb5b62c960eb8e8b4ed ');
 Map<String,dynamic> jsonData = response.data;
 List<dynamic> articles =jsonData['articles'];
 List<LowerNewsModel> articleslist=[];
  for (var element in articles) {
    LowerNewsModel lowerNewsMode = LowerNewsModel(
      image: element['urlToImage'], 
      url: element['url'], 
      author: element['author'], 
      title: element['title'], 
      description: element['description'], 
      content: element['content']);
      articleslist.add(lowerNewsMode);
      }
      List<String> randomStrings = generateRandomStrings(articleslist.length);
      for(int i=0; i<articleslist.length;i++){
        articleslist[i].tag=randomStrings[i];
        }
      return articleslist;
    }  
  
  }

  List<String> generateRandomStrings(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  List<String> randomStrings = [];

  while (randomStrings.length < length) {
    String randomString = '';

    for (int j = 0; j < 3; j++) { // Change 10 to the desired length of each random string
      randomString += chars[random.nextInt(chars.length)];
    }

    if (!randomStrings.contains(randomString)) {
      randomStrings.add(randomString);
    }
  }
  return randomStrings;
} 