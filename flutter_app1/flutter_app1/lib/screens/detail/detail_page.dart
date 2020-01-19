import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/models/news.dart';

// ignore: must_be_immutable
class MyDetails extends StatelessWidget {
  NewsCard news;
  MyDetails(this.news);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(news.title)
        ,
      ), child: null,

    ):
    Scaffold(
      appBar: AppBar(
          title: Text(news.title)
      ),
      body: Column(
        children: <Widget>[
          Image.network(news.urlToImage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(news.title,
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(news.publishedAt.toString()),
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
