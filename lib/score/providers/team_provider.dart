import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:net_play/main.dart';

import '../config/utils.dart';
import '../modals/possible_match_item.dart';


/// Notifier for managing teams and possible matches
class TeamNotifier extends StateNotifier<List<Map<String, List<String>>>> {
  TeamNotifier() : super([]);

  /// Add teams to the state
  void addTeams(List<String> createdTeams) {
    final tempTeams = _generateTeams(createdTeams);
    debugPrint("Generated Teams : $tempTeams");
    state = tempTeams;
  }

  /// Generate possible matches from teams
  List<TeamItem> possibleMatches() {
    final possibleTeams = Utils.getCombination(state, state.length, 2);
    debugPrint("Generated Matches : $possibleTeams");
    return _generateItems(possibleTeams);
  }

  /// Generate teams based on the list of players
  List<Map<String, List<String>>> _generateTeams(List<String> createdTeams) {
    final tempTeams = <Map<String, List<String>>>[];

    for (int i = 0; i < (createdTeams.length % 2 == 0
        ? createdTeams.length ~/ 2
        : createdTeams.length ~/ 2 + 1); i++) {
      final tempPlayers = [
        createdTeams[i * 2],
        i * 2 + 1 < createdTeams.length ? createdTeams[i * 2 + 1] : '--'
      ];
      final tempTeam = {'Team ${String.fromCharCode(65 + i)}': tempPlayers};
      tempTeams.add(tempTeam);
    }

    return tempTeams;
  }

  /// Generate TeamItem list from possible matches data
  List<TeamItem> _generateItems(var data) {
    return List<TeamItem>.generate(
      data.length % 2 == 0 ? data.length ~/ 2 : data.length ~/ 2 + 1,
          (int index) {
        final teamAlphaIndex = index * 2;
        final teamBetaIndex = index * 2 + 1;
        final teamAlphaKey = data[teamAlphaIndex].keys.first;
        final teamBetaKey = data[teamBetaIndex].keys.first;
        final playerAlpha1 = data[teamAlphaIndex].values.first.first;
        final playerAlpha2 = data[teamAlphaIndex].values.first.last;
        final playerBeta1 = data[teamBetaIndex].values.first.first;
        final playerBeta2 = data[teamBetaIndex].values.first.last;
        return TeamItem(
          id: index,
          teamAlpha: teamAlphaKey,
          playerAlpha1: playerAlpha1,
          playerAlpha2: playerAlpha2,
          teamBeta: teamBetaKey,
          playerBeta1: playerBeta1,
          playerBeta2: playerBeta2,
          expandedValue: 'This is item number $index',
        );
      },
    );
  }
}

final teamProvider =
StateNotifierProvider<TeamNotifier, List<Map<String, List<String>>>>((ref) {
  return TeamNotifier();
});
