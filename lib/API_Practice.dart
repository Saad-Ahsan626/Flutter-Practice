import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String apiUrl = 'https://fakestoreapi.com/products/1';

class apiModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;

  apiModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });

  factory apiModel.fromJson(Map<String, dynamic> json) {
    return apiModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
    );
  }
}

final apiProvider = FutureProvider<apiModel>((ref) async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    return apiModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
});

class ApiScreen extends ConsumerWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: ref.watch(apiProvider).when(
              data: (data) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('ID: ${data.id}'),
                Text('Title: ${data.title}'),
                Text('Price: \$${data.price}'),
                Text('Description: ${data.description}'),
                Text('Category: ${data.category}'),
              ],
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
        );
      },
      )
    );
  }
}
