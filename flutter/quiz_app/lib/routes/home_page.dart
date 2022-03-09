import 'package:flutter/material.dart';
import 'package:quiz_app/routes.dart';

class Category {
  const Category(this.id, this.name);

  final int id;
  final String name;

  factory Category.fromJson(Map<String, Object> json) {
    return Category(json["id"] as int, json["name"] as String);
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final categories = List<Category>.from([
    {"id": 9, "name": "General Knowledge"},
    {"id": 10, "name": "Entertainment: Books"},
    {"id": 11, "name": "Entertainment: Film"},
    {"id": 12, "name": "Entertainment: Music"},
    {"id": 13, "name": "Entertainment: Musicals & Theatres"},
    {"id": 14, "name": "Entertainment: Television"},
    {"id": 15, "name": "Entertainment: Video Games"},
    {"id": 16, "name": "Entertainment: Board Games"},
    {"id": 17, "name": "Science & Nature"},
    {"id": 18, "name": "Science: Computers"},
    {"id": 19, "name": "Science: Mathematics"},
    {"id": 20, "name": "Mythology"},
    {"id": 21, "name": "Sports"},
    {"id": 22, "name": "Geography"},
    {"id": 23, "name": "History"},
    {"id": 24, "name": "Politics"},
    {"id": 25, "name": "Art"},
    {"id": 26, "name": "Celebrities"},
    {"id": 27, "name": "Animals"},
    {"id": 28, "name": "Vehicles"},
    {"id": 29, "name": "Entertainment: Comics"},
    {"id": 30, "name": "Science: Gadgets"},
    {"id": 31, "name": "Entertainment: Japanese Anime & Manga"},
    {"id": 32, "name": "Entertainment: Cartoon & Animations"}
  ].map((e) => Category.fromJson(e)));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Qwiz"),
          leading: new IconButton(onPressed: () {}, icon: Icon(Icons.quiz)),
        ),
        body: Column(
          children: [
            Text("Select category"),
            Expanded(
                child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(
                    RouteGenerator.difficultyPage,
                    arguments: categories[index].id),
                child: Text(categories[index].name),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
