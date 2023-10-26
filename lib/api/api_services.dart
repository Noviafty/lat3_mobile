import 'dart:convert';
import 'package:flutterapp/model/todos.dart';
import 'package:http/http.dart' as http;


class ApiService {
  Future<Todos> fetchTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));

    if (response.statusCode == 200) {
      return Todos.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}