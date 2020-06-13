import 'package:building/models/menu_model/main_menu_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'connect_event.dart';
import 'connect_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  @override
  ConnectState get initialState => ConnectUninitialized();

  @override
  Stream<ConnectState> mapEventToState(ConnectEvent event) async* {
    if (event is CheckConnectEvent) {
    } else if (event is DemoConnectEvent) {
      final listOfMainMenuModel = MainMenuModel.getDemoData();
      yield ConnectAuthenticated(
        demo: true,
        listOfMainMenuModel: listOfMainMenuModel,
      );
    } else if (event is LoggedInEvent) {
    } else if (event is AppStartedEvent) {
    } else {}
  }
}
