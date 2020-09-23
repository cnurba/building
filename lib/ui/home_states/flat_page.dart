import 'package:building/blocs/flat_bloc/flat_bloc.dart';
import 'package:building/blocs/flat_bloc/flat_state.dart';
import 'package:building/ui/home_states/booked_free_flats.dart';
import 'package:building/ui/home_states/free_flats.dart';
import 'package:building/ui/home_states/un_free_flats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlatBloc, FlatState>(
        builder: (context, state) {
          if (state is InitializedFreeFlatState) {
            return FreeFlatsPage(flatList: state.flatList,);
          } else if (state is InitializedUnFreeFlatState) {
            return UnFreeFlatsPage(flatList: state.flatList,);
          } else if (state is InitializedBookedFlatState) {
            return BookedFlatsPage(flatList: state.flatList,);
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }
}
