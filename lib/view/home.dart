import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/newsController.dart';
import 'package:news/model/newsModel.dart';

class Home extends GetWidget {
  NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("app Bar")),
      body: FutureBuilder(
        future: newsController.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          Article data = snapshot.data;
          return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                     // Image.network(data.articles[index].urlToImage.toString()),
                      Text(data.articles[index].author,
                        style: TextStyle(fontSize: 25,color:Colors.green[700] ),),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(data.articles[index].title,
                          style: const TextStyle(fontSize: 20),
                            textDirection:TextDirection.rtl ),
                      ),

                     // Text(data.articles[index].description.toString()),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
