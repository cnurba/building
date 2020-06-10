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
    );
  }

}




