import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app1/models/news.dart';
import 'package:flutter_app1/screens/detail/detail_page.dart';
import 'package:http/http.dart' as http;

class MyCards extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Widgets',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyCardsPage(title: 'Flutter Cards Page'),
    );
  }
}

class MyCardsPage extends StatefulWidget {
  MyCardsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

Future<void> printAfter4Sec() async{
  String result = await Future.delayed(Duration(seconds: 4), () => "Success");
  print(result);
}

class _MyCardsPageState extends State<MyCardsPage> {
//  void _incrementCounter() {
//    setState(() {});
//  }
  bool _isLoading;
  List<NewsCard> newsList = [];

  @override
  void initState() {
    // TODO: implement initState
//    newsList.add(NewsCard(
//        'เหมือนตบหน้าชาวจีน สาวโพสต์อวดขับรถยนต์เข้าพระราชวังต้องห้าม',
//        'https://static.posttoday.com/media/content/2020/01/18/AA7AE3E113F64444955D58E207B88D0A.jpeg',
//        DateTime.now(),
//    'ฟซบุ๊คเพจ Kornkit Disthan ของนักวิชาการชื่อดัง เขียนถึงเรื่องนี้ไว้ว่า “เรื่องใหญ่ที่เมืองจีน มีคนจับได้ว่าผู้หญิงชื่อแอ็คเคาท์ว่า ???LL ขับรถเข้าไปในเขตพระราชฐานของพระราชวังต้องห้าม'));
//    newsList.add(NewsCard(
//        '"ขอให้เชื่อมั่นความสามารถตำรวจ" ผบ.ตร.ปรับแผนล่าโจรกราดยิงชิงทองลพบุรี"',
//        'https://static.posttoday.com/media/content/2020/01/17/7278FFC639514ED289EBAEFC960E446F.jpg',
//        DateTime.parse("2020-01-17 19:06:00"),
//    'ผบ.ตร.ติดตามคดีโจรกราดยิงชิงทองลพบุรี แบ่งทีมทำงาน25ชุด ขอคนใกล้ชิดที่รู้ตัวผู้ต้องหาให้เบาะแสขณะเงินรางวัลนำจับเพิ่มเป็น6แสนบาทแล้ว'));
//    newsList.add(NewsCard(
//        'ค่าฝุ่นPM2.5พุ่ง! 37 สถานี เริ่มมีผลกระทบต่อสุขภาพ',
//        'https://static.posttoday.com/media/content/2020/01/18/6C9116CB7B784DF49A320EB1E5A0EE99.jpg',
//        DateTime.parse("2020-01-18 10:15:00"),
//    'กรมคุมควบคุมมลพิษ รายงาน ปริมาณฝุ่นละออง ภาพรวมมีแนวโน้มเพิ่มขึ้นทุกพื้นที่เมื่อเทียบกับช่วงเช้าวันที่ 17 ม.ค. 37 สถานีเป็นสีส้ม เริ่มมีผลกระทบต่อสุขภาพ'));
    Future<void> _fetchNews() async {
      setState(() {
        _isLoading = true;
      });
      final response = await http.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=f4c459036709452bb4dd707700e62f7f');
      var responseJson = json.decode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(responseJson);
      setState(() {
        newsList = newsResponse.articles;
        _isLoading = false;
      });
    }
  
    Future<void> loadData() async {
      setState(() {
        _isLoading = true;
      });
      String result = await Future.delayed(Duration(seconds: 4), () => "Success");
      print(result);
      setState(() {
        _isLoading = false;
      });
    }

//    printAfter4Sec();
//    print('Dont wait');
    _fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[Icon(Icons.create)],
          backgroundColor: Colors.amber,
        ),
        body:
        Container(
          child:
//          Row(
//            children: <Widget>[
//              _isLoading ? CircularProgressIndicator(
//                backgroundColor: Colors.blue,)
//                  : Text('NEWS'),
//              ListView.builder(
//                  itemCount: newsList.length,
//                  itemBuilder: (context, index) {
//                    return GestureDetector(
//                      onTap: () {
//                        Navigator.push(context,
//                            MaterialPageRoute(
//                                builder: (context) =>
//                                    MyDetails(newsList[index])));
//                      },
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Image.network(newsList[index].urlToImage),
//                          Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text(newsList[index].title,
//                                style: TextStyle(
//                                    fontSize: 24, fontWeight: FontWeight.bold)),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text(
//                                newsList[index].publishedAt.toString()
//                            ),
//                          ),
//                        ],
//                      ),
//                    );
//                  }),
//            ],
//          ),
          _isLoading ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              )
          ) :

          ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => MyDetails(newsList[index])));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(newsList[index].urlToImage),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(newsList[index].title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            newsList[index].publishedAt.toString()
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
    );
  }
}
