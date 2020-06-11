import 'package:building/models/user/connection_option.dart';
import 'package:building/models/user/user.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class AppStartedEvent extends ConnectEvent {
   @override
  String toString() {
    return "Приложение запущено";
  }
}

class LoggedInEvent extends ConnectEvent {
  final ConnectionOption connectionOption;
  final User user;
  LoggedInEvent({this.user, this.connectionOption});
  @override
  String toString() {
    return "Пользователь ${connectionOption.login} вошел";
  }
}

class CheckConnectEvent extends ConnectEvent {
  final ConnectionOption connectionOption;
  CheckConnectEvent({this.connectionOption});
  @override
  String toString() {
    return "Проверка ${connectionOption.http} соединения";
  }
}

class DemoConnectEvent extends ConnectEvent {
   @override
  String toString() {
    return "Демо соединения";
  }
}

class loggedOut extends ConnectEvent {
  @override
  String toString() {
    return "Выход";
  }
}


