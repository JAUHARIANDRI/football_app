part of 'events_league_bloc.dart';

@immutable
abstract class EventsLeagueEvent {}

class EventsStarted extends EventsLeagueEvent {
  final String idLeague;
  EventsStarted(this.idLeague);
}
