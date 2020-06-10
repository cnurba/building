import 'package:building/models/user/connection_option.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class ConnectLoading extends ConnectState {

}

class DirectorConnected extends ConnectState {
  final ConnectionOption connectionOption;

  DirectorConnected({this.connectionOption});
}


class ErrorState extends ConnectState{
  String errorText ;
  ErrorState({this.errorText});

}


class ConnectUninitialized extends ConnectState{}

