import 'package:football_app/src/models/list_club.dart';
import 'package:football_app/src/models/list_event_league.dart';
import 'package:football_app/src/models/list_liga.dart';
import 'package:football_app/src/resource/api_provider.dart';

class ApiRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<ListAllLiga> getAllLeagues() => _apiProvider.getAllLeagues();

  Future<ListAllTeams> getAllLTeam() => _apiProvider.getAllLTeam();

  Future<ListAllTeams> getSarchTeam(String teamSerach) =>
      _apiProvider.getSarchTeam(teamSerach);

  Future<ListEventLeague> getEventLeague(String idLeague) =>
      _apiProvider.getEventLeague(idLeague);
}
