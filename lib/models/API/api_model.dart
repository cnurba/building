class APIModel<T>{
  T data;
  String errorText;
  bool error;

  APIModel({this.data, this.errorText, this.error});
}