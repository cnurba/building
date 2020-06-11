import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
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
  final User user;
  LoggedIn({this.user, this.connectionOption});
  @override
  String toString() {
    return "Пользователь ${connectionOption.login} вошел";
  }
}

class CheckConnect extends ConnectEvent {
  final ConnectionOption connectionOption;
  CheckConnect({this.connectionOption});
  @override
  String toString() {
    return "Проверка ${connectionOption.http} соединения";
  }
}

class loggedOut extends ConnectEvent {
  @override
  String toString() {
    return "Выход";
  }
}


