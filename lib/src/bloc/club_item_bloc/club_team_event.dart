part of 'club_team_bloc.dart';

@immutable
abstract class ClubTeamEvent {}

class ClubTeamStarted extends ClubTeamEvent {}

class ClubTeamSearchStarted extends ClubTeamEvent {
  final String namaTeam;
  ClubTeamSearchStarted(this.namaTeam);
}
