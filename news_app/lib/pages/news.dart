import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/articlebar.dart';
// import 'package:news_app/widgets/menu.dart';
import 'package:news_app/models/Productnews.dart';
import 'package:news_app/services/newservice.dart';

class NewsApp extends StatefulWidget {
  NewsApp() {}
  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  NewsProductService service = NewsProductService();
  List<Newsarticle> articles = [];
  @override
  void initState() {
    super.initState();
    Future<List<Newsarticle>> future = service.getNewsarticle();
    future.then((List<Newsarticle> articles) {
      setState(() {
        this.articles = articles;
      });
    }).catchError((err) => print("Error is $err"));
  }

  @override
  Widget build(BuildContext context) {
    const imageURL =
        'https://c1.wallpaperflare.com/preview/21/93/67/news-yellow-newspaper-3d.jpg';
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Taaja News"),
        elevation: 10,
        shadowColor: Colors.grey,
        // leading: Icon(Icons.menu),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
          child: Column(children: [
        Divider(),
        // Container(
        //   height: 60,
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: <Widget>[
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('World')),
        //         decoration: BoxDecoration(
        //           color: Colors.orangeAccent,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('Business')),
        //         decoration: BoxDecoration(
        //           color: Color.fromARGB(255, 255, 105, 105),
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         padding: EdgeInsets.symmetric(vertical: 5.0),
        //         child: const Center(child: Text('Finance')),
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('Technology')),
        //         decoration: BoxDecoration(
        //           color: Color.fromARGB(255, 228, 147, 242),
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('Sports')),
        //         decoration: BoxDecoration(
        //           color: Colors.lime,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('Defence')),
        //         decoration: BoxDecoration(
        //           color: Colors.greenAccent,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('Fashion')),
        //         decoration: BoxDecoration(
        //           color: Colors.lightBlueAccent,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('Health')),
        //         decoration: BoxDecoration(
        //           color: Colors.redAccent,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         child: const Center(child: Text('Entertainment')),
        //         decoration: BoxDecoration(
        //           color: Colors.pink,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(38),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Divider(),
        Container(
          width: 392.7,
          child: Image.network(
              'https://static.toiimg.com/photo/msid-98618608/98618608.jpg'),
        ),
        Divider(),
        Wrap(
          children: articles
              .map((e) => Articlebar(imageurl: e.urlToImage, label: e.title))
              .toList(),
        )
      ])),
      // bottomNavigationBar: BottomAppBar(
      //   height: 50,
      //   elevation: 10,
      //   color: Colors.white,
      //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      //     Icon(Icons.home),
      //     Icon(Icons.search),
      //     Icon(Icons.favorite),
      //     Icon(Icons.settings)
      //   ]),
      // ),
    );
  }
}
