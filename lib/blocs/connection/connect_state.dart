import 'package:building/models/user/connection_option.dart';
import 'package:equatable/equatable.dart';

abstract class ConnectState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}
//waiting to see if the user is authenticated or not on app start
class ConnectUninitialized  extends ConnectState {}
//waiting to persist/delete a token
class ConnectLoading extends ConnectState{}
//successfully authenticated
class ConnectAuthenticated  extends ConnectState{}
//not authenticated
class ConnectUnauthenticated  extends ConnectState{}


