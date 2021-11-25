import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:tes_salt/BusinessLogic/NewsController.dart';
import 'package:tes_salt/View/ArtikelScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id');
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.cyanAccent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing SALT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "Testing SALT",
      ),
      getPages: [
        GetPage(name: '/',                    page: () => MyApp()),
        GetPage(name: '/home',                page: () => MyHomePage(title: 'Testing Salt')),
        GetPage(name: '/artikel',                    page: () => ArticleScreen()),
        // GetPage(name: '/score', page: () => ScoreScreen()),
        // GetPage(name: '/background', page: () => BackgroundScreen()),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff4f6f9),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.black,
                ),
                // Image.asset(
                //   'assets/logo.png',
                //   height: 40,
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 5,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  hintText: 'Search...',
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DefaultTabController(length: 3,
              child: TabBar(
                indicatorColor: Colors.green,
                tabs: [
                  Tab(
                    text: "Sport",
                  ),
                  Tab(
                    text: "Parenting",
                  ),
                  Tab(
                    text: "News",
                  ),
                ],
                labelColor: Colors.black,
                // add it here
                indicator: DotIndicator(
                  color: Colors.black,
                  distanceFromCenter: 16,
                  radius: 3,
                  paintingStyle: PaintingStyle.fill,
                ),
              ),
          ),

          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Daftar Berita',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GetBuilder<NewsController>(
            builder: (value){
              if(value.listArtikel.length == 0){
                return Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: CircularProgressIndicator(),
                );
              }else{
                return Container(
                  height: Get.height*0.8,
                  child: ListView.builder(
                      itemCount: value.listArtikel.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return NewsWidget(
                            index
                        );
                      })
                );
              }

            },
          ),

        ],
      ),
    );
  }

  Widget NewsWidget(int index){

    return GestureDetector(
      onTap: () {

        Get.toNamed(
          '/artikel',
          arguments : {
            'article': newsController.listArtikel[index]
          },
        );

      },
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width - 40,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 0,
                offset: Offset(3, 3),
              )
            ]),
        child: Row(
          children: [
            if(newsController.listArtikel[index].urlToImage == null || newsController.listArtikel[index].urlToImage=="")
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/messi.jpg'),
                  ),
                ),
              ),

            if(newsController.listArtikel[index].urlToImage != null && newsController.listArtikel[index].urlToImage!="")
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(newsController.listArtikel[index].urlToImage),
                  ),
                ),
              ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          DateFormat(
                              'hh:mm, dd MMMM yyyy',
                              'id')
                              .format(newsController.listArtikel[index].publishedAt),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      newsController.listArtikel[index].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      newsController.listArtikel[index].author,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
