





import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tlist_states_ui.dart';
import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tournament_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TournamentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentListCubit,TournamentListState>(
        builder: (context,state) {
          return TournamentListStateUI(state);
        });
  }
}

