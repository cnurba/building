abstract class SideBarEvent{}

class OpenSideBarEvent extends SideBarEvent{
  final bool isSideBarOpened;
  final bool demo;
  OpenSideBarEvent({this.isSideBarOpened, this.demo});
}

class CloseSideBarEvent extends SideBarEvent{
  final bool isSideBarOpened;
  final bool demo;
  CloseSideBarEvent({this.isSideBarOpened, this.demo});
}
