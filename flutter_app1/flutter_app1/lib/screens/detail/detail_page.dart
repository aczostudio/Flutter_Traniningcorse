import 'package:flutter/material.dart';
import 'package:flutter_app1/models/news.dart';

class MyDetails extends StatelessWidget {
  NewsCard news;
  MyDetails(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(news.title)
      ),
      body: Column(
        children: <Widget>[
          Image.network(news.coverUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(news.title,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(news.createdAt.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(news.content),
          ),
        ],
      ),
    );
  }
}
