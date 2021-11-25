import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:tes_salt/Model/News.dart';
import 'package:tes_salt/Network/ApiClient.dart';

class NewsViewModel {
  static Future<News> getNews() async {
    // future is used to handle the error when calling api > Future + async or await
    ApiClient apiClient = new ApiClient();
    var dan = '&';
    var url = apiClient.getUri("everything?q=Apple&from=2021-11-25&sortBy=popularity&apiKey=3fe817e193a64ce1b08bea4d03f80077");
    print(url.toString());
    var data;
    data = await http.get(url,
        headers: {
          'Accept': 'application/json',
          'Connection' : 'keep-alive',
          // 'Authorization': "token $token"
        });

    print('Cek Data News : '+data.body);
    return newsFromJson(data.body);

  }
}
