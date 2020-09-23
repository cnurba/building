import 'dart:convert';

class ConnectionOption {
  String login;
  String password;
  String ip;
  String http;
  String port;

  ConnectionOption({this.login, this.password, this.ip, this.http, this.port});

  String getBaseUrl(){
    return "http://${ip}:${port}/${http}";
  }

 Map<String,String>  getHeaders () {
    return {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$login:$password')),
      'Content-type': 'text/html; charset=utf-8',
    };
 }

 factory ConnectionOption.fromJson(Map<String,dynamic> parsedJson){
    return new ConnectionOption(
      password: parsedJson["password"],
      login: parsedJson["login"],
      http: parsedJson["http"],
      ip: parsedJson["ip"],
      port: parsedJson["port"],
    );
  }

  Map<String,String> toJson() =>{
    "login":login,
    "password":password,
    "ip":ip,
    "http":http,
    "port":port,
  };

}




