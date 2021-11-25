import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tes_salt/Model/News.dart';
import 'package:tes_salt/Network/ApiClient.dart';
import 'package:tes_salt/ViewModel/NewsViewModel.dart';

class NewsController extends GetxController {
  RxBool loading      = true.obs;
  RxList<Article> listArtikel = new RxList();
  late News news;

  onInit() async {
    super.onInit();

    initData();
  }

  initData() async {

    news = await NewsViewModel.getNews();
    listArtikel.addAll(news.articles);
    loading.value = false;
    update();

  }

}