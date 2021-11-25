import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tes_salt/Model/News.dart';


class ArticleScreen extends StatelessWidget {
  late Article article;

  @override
  Widget build(BuildContext context) {

    article       = Get.arguments['article'];

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [

                    if(article.urlToImage == null || article.urlToImage=="")
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/messi.jpg'),
                          ),
                        ),
                      ),

                    if(article.urlToImage != null && article.urlToImage!="")
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(article.urlToImage),
                          ),
                        ),
                      ),

                    Positioned(
                      right: 10,
                      top: 10,
                      child: Icon(
                        Icons.more_vert,
                        size: 40,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat(
                                'hh:mm, dd MMMM yyyy',
                                'id')
                                .format(article.publishedAt),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        article.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   children: [
                      //     Image.asset(
                      //       article.author,
                      //       height: 30,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        article.description,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
//                      fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        ),

                      ),
                      Icon(
                        Icons.share,
                        size: 30,
                        color: Colors.black,
                      ),
                      // Icon(
                      //   Icons.arrow_forward,
                      //   color: Colors.black,
                      //   size: 30,
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
