import 'package:bloc/bloc.dart';
import 'package:football_app/src/models/list_club.dart';
import 'package:football_app/src/resource/api_repository.dart';
import 'package:meta/meta.dart';

part 'club_team_event.dart';
part 'club_team_state.dart';

class ClubTeamBloc extends Bloc<ClubTeamEvent, ClubTeamState> {
  ClubTeamBloc() : super(ClubTeamInitial());

  final ApiRepository _repository = ApiRepository();
  List<DataAllTeams> _listDataAllTeam = new List();
  ListAllTeams _response = ListAllTeams();

  @override
  Stream<ClubTeamState> mapEventToState(
    ClubTeamEvent event,
  ) async* {
    try {
      if (event is ClubTeamStarted) {
        yield ClubAllTemProgress();
        _response = await _repository.getAllLTeam();
        if (_response.dataAllTeam != null) {
          _listDataAllTeam = _response.dataAllTeam;
          yield ClubAllTeamLoaded(_listDataAllTeam);
        }
      }

      if (event is ClubTeamSearchStarted) {
        _response = await _repository.getSarchTeam(event.namaTeam);
        if (_response.dataAllTeam != null) {
          yield ClubSearchTeamLoaded(_response.dataAllTeam);
        } else {
          yield ClubSearchTeamEmpty();
        }
      }
    } on Error {
      yield ClubAllTeamFailure();
    }
  }
}
