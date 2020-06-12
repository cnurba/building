class User {
  String name;
  String password;
  User({this.password,this.name});

  factory User.fromJson(Map<String,dynamic> parsedJson){
     return User(
      name: parsedJson["name"],
     password: parsedJson["password"],
     );
   }
  Map<String,dynamic>toJson()=>{
     "name":name,
     "password":password,
  };
}