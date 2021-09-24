part of 'club_team_bloc.dart';

@immutable
abstract class ClubTeamState {}

class ClubTeamInitial extends ClubTeamState {}

class ClubAllTeamLoaded extends ClubTeamState {
  final List<DataAllTeams> listDataAllTeam;

  ClubAllTeamLoaded(this.listDataAllTeam);
}

class ClubAllTeamFailure extends ClubTeamState {}

class ClubAllTemProgress extends ClubTeamState {}

class ClubAllTeamEmpty extends ClubTeamState {}

class ClubSearchTeamLoaded extends ClubTeamState {
  final List<DataAllTeams> listDataAllTeam;

  ClubSearchTeamLoaded(this.listDataAllTeam);
}

class ClubSearchTeamEmpty extends ClubTeamState {}
