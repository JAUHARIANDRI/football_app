import 'package:bloc/bloc.dart';
import 'package:football_app/src/models/list_event_league.dart';
import 'package:football_app/src/resource/api_repository.dart';
import 'package:meta/meta.dart';

part 'events_league_event.dart';
part 'events_league_state.dart';

class EventsLeagueBloc extends Bloc<EventsLeagueEvent, EventsLeagueState> {
  EventsLeagueBloc() : super(EventsLeagueInitial());
  final ApiRepository _repository = ApiRepository();
  List<DataEventLeague> _listDataEventsLeague = new List();
  ListEventLeague _response = ListEventLeague();
  @override
  Stream<EventsLeagueState> mapEventToState(
    EventsLeagueEvent event,
  ) async* {
    try {
      if (event is EventsStarted) {
        yield EventsLeagueProgress();
        _response = await _repository.getEventLeague(event.idLeague);
        if (_response.dataEventLeague != null) {
          _listDataEventsLeague = _response.dataEventLeague;
          yield EventsLeagueLoaded(_listDataEventsLeague);
        }
      }
    } on Error {}
  }
}
