import 'package:building/models/user/connection_option.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class AppStarted extends ConnectEvent {
   @override
  String toString() {
    return "Приложение запущено";
  }
}

class LoggedIn extends ConnectEvent {
  final ConnectionOption connectionOption;
  LoggedIn({this.connectionOption});

  @override
  String toString() {
    return "Пользователь ${connectionOption.login} вошел";
  }
}

class loggedOut extends ConnectEvent {
  @override
  String toString() {
    return "Выход";
  }
}


