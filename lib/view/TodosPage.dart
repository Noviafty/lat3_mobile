import 'package:flutter/material.dart';
import 'package:flutterapp/api/api_services.dart';
import 'package:flutterapp/model/todos.dart';
import 'package:get/get.dart';


class TodosPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Todos>(
          future: apiService.fetchTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final data = snapshot.data;

              if (data == null) {
                return const Text('No Data');
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User ID: ${data.userId}'),
                  Text('ID: ${data.id}'),
                  Text('Title: ${data.title}'),
                  Text('Completed: ${data.completed ? 'Yes' : 'No'}'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}