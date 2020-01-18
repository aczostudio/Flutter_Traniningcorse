import 'package:flutter/material.dart';
import 'package:flutter_app1/models/news.dart';
import 'package:flutter_app1/screens/detail/detail_page.dart';

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

class _MyCardsPageState extends State<MyCardsPage> {
//  void _incrementCounter() {
//    setState(() {});
//  }

  List<NewsCard> newsList = [];

  @override
  void initState() {
    // TODO: implement initState
    newsList.add(NewsCard(
        'เหมือนตบหน้าชาวจีน สาวโพสต์อวดขับรถยนต์เข้าพระราชวังต้องห้าม',
        'https://static.posttoday.com/media/content/2020/01/18/AA7AE3E113F64444955D58E207B88D0A.jpeg',
        DateTime.now(),
    'ฟซบุ๊คเพจ Kornkit Disthan ของนักวิชาการชื่อดัง เขียนถึงเรื่องนี้ไว้ว่า “เรื่องใหญ่ที่เมืองจีน มีคนจับได้ว่าผู้หญิงชื่อแอ็คเคาท์ว่า ???LL ขับรถเข้าไปในเขตพระราชฐานของพระราชวังต้องห้าม'));
    newsList.add(NewsCard(
        '"ขอให้เชื่อมั่นความสามารถตำรวจ" ผบ.ตร.ปรับแผนล่าโจรกราดยิงชิงทองลพบุรี"',
        'https://static.posttoday.com/media/content/2020/01/17/7278FFC639514ED289EBAEFC960E446F.jpg',
        DateTime.parse("2020-01-17 19:06:00"),
    'ผบ.ตร.ติดตามคดีโจรกราดยิงชิงทองลพบุรี แบ่งทีมทำงาน25ชุด ขอคนใกล้ชิดที่รู้ตัวผู้ต้องหาให้เบาะแสขณะเงินรางวัลนำจับเพิ่มเป็น6แสนบาทแล้ว'));
    newsList.add(NewsCard(
        'ค่าฝุ่นPM2.5พุ่ง! 37 สถานี เริ่มมีผลกระทบต่อสุขภาพ',
        'https://static.posttoday.com/media/content/2020/01/18/6C9116CB7B784DF49A320EB1E5A0EE99.jpg',
        DateTime.parse("2020-01-18 10:15:00"),
    'กรมคุมควบคุมมลพิษ รายงาน ปริมาณฝุ่นละออง ภาพรวมมีแนวโน้มเพิ่มขึ้นทุกพื้นที่เมื่อเทียบกับช่วงเช้าวันที่ 17 ม.ค. 37 สถานีเป็นสีส้ม เริ่มมีผลกระทบต่อสุขภาพ'));
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
        body: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyDetails(newsList[index])));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(newsList[index].coverUrl),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(newsList[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          newsList[index].createdAt.toString()
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
