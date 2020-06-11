class ConnectionOption {
  String login;
  String password;
  String ip;
  String http;
  String port;

  ConnectionOption({this.login, this.password, this.ip, this.http, this.port});

  factory ConnectionOption.fromJson(Map<String,dynamic> parsedJson){
    return new ConnectionOption(
      password: parsedJson["password"],
      login: parsedJson["login"],
      http: parsedJson["http"],
      ip: parsedJson["ip"],
      port: parsedJson["port"],

    );
  }

  Map<String,dynamic> toJson() =>{
    "login":login,
    "password":password,
    "ip":ip,
    "http":http,
    "port":port,
  };

}




