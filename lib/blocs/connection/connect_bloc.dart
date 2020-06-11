import 'package:flutter_bloc/flutter_bloc.dart';
import 'connect_event.dart';
import 'connect_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  @override
  ConnectState get initialState => ConnectUninitialized();

  @override
  Stream<ConnectState> mapEventToState(ConnectEvent event) async* {



  }


}
