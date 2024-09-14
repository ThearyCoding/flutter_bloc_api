import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constant.dart';


class ApiService{

  Future<List<dynamic>> fetchPosts() async{
    final response =await http.get(Uri.parse('$baseUrl/posts'));

    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    else{
      return throw Exception("Failed to load posts");
    }
  }
}