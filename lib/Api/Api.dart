import 'dart:convert';

import 'package:bivisoft/model/http_response.dart';
import 'package:http/http.dart' as http;


class Api{
   Future<HttpResponseApi?> getUserStatus(String email, String password) async {
        final response = await http.get(Uri.parse("https://hrsoftware.bivisoft.com/api/login?email=$email&pass=$password"));
        if(response.statusCode == 200){
           print("200");
           print(response.body);
           return HttpResponseApi.fromJson(jsonDecode(response.body));
        } else {
          throw Exception('Failed to load album');
        }
   }
}