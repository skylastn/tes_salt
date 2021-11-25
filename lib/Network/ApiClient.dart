import 'package:tes_salt/Network/Config.dart';

class ApiClient{
  var configclient = new Config();

  String getUrl(){
    if(configclient.config == "dev"){
      return "https://newsapi.org";
    }else {
      return "https://newsapi.org";
    }
  }

  String getIndexUrl(){
    if(configclient.config == "dev"){
      return "/v2/";
    }else {
      return "/v2/";
    }
  }

  Uri getUri(String path){
    if(configclient.config == "dev"){
      return Uri.parse(getUriString(path));
    }else {
      return Uri.parse(getUriString(path));
    }
  }

  String getUriString(String path){
    if(configclient.config == "dev"){
      return getUrl() + getIndexUrl()+ path;
    }else {
      return getUrl() + getIndexUrl()+ path;
    }
  }




}