part of 'events_league_bloc.dart';

@immutable
abstract class EventsLeagueState {}

class EventsLeagueInitial extends EventsLeagueState {}

class EventsLeagueLoaded extends EventsLeagueState {
  final List<DataEventLeague> listDataEventLeague;

  EventsLeagueLoaded(this.listDataEventLeague);
}

class EventsLeagueFailure extends EventsLeagueState {}

class EventsLeagueProgress extends EventsLeagueState {}
