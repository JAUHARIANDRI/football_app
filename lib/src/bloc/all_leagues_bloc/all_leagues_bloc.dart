import 'package:bloc/bloc.dart';
import 'package:football_app/src/models/list_liga.dart';
import 'package:football_app/src/resource/api_repository.dart';
import 'package:meta/meta.dart';

part 'all_leagues_event.dart';
part 'all_leagues_state.dart';

class AllLeaguesBloc extends Bloc<AllLeaguesEvent, AllLeaguesState> {
  AllLeaguesBloc() : super(AllLeaguesInitial());

  final ApiRepository _repository = ApiRepository();
  List<DataLeagues> _listDataLeagues = new List();
  ListAllLiga _response = ListAllLiga();

  @override
  Stream<AllLeaguesState> mapEventToState(
    AllLeaguesEvent event,
  ) async* {
    try {
      yield AllLeaguesProgress();
      if (event is AllLeaguesStarted) {
        _response = await _repository.getAllLeagues();
        if (_response.dataLeagues != null) {
          for (int i = 0; i < _response.dataLeagues.length; i++) {
            if (_response.dataLeagues[i].strSport == "Soccer") {
              _listDataLeagues.add(
                new DataLeagues(
                  idLeague: _response.dataLeagues[i].idLeague,
                  strLeague: _response.dataLeagues[i].strLeague,
                  strFanart1: _response.dataLeagues[i].strFanart1,
                  strLeagueAlternate:
                      _response.dataLeagues[i].strLeagueAlternate,
                  strSport: _response.dataLeagues[i].strSport,
                  strBadge: _response.dataLeagues[i].strBadge,
                ),
              );

              yield AllLeaguesSuccess(_listDataLeagues);
            }
          }
        }
      }
    } on Error {
      yield AllLeaguesFailure();
    }
  }
}
