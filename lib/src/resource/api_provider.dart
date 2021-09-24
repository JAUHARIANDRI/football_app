import 'package:dio/dio.dart';
import 'package:football_app/src/data/constants.dart';
import 'package:football_app/src/models/list_club.dart';
import 'package:football_app/src/models/list_event_league.dart';
import 'package:football_app/src/models/list_liga.dart';
import 'package:football_app/src/utils/values/strings.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = EndPoints.BASE_URL_API;

  ApiProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        print("--> ${options.method} $_baseUrl${options.path}");
        print("Content type: ${options.contentType}");
        print("<-- END HTTP");
      }, onResponse: (Response response) async {
        print("--> RES : ${response.data} ");
        print("<-- END RES");
      }, onError: (DioError dioError) {
        print("--> ERROR : $dioError");
      }),
    );
  }

  Future<ListAllLiga> getAllLeagues() async {
    try {
      _dio.options.headers = await getHeaders(false, "");
      Response response = await _dio.get(EndPoints.GET_ALL_LEAGUES);
      return ListAllLiga.fromJson(response.data);
    } catch (error, stacktrace) {
      print("ERRORRR");
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListAllLiga.withError(Dictionary.warning_dio);
    }
  }

  Future<ListAllTeams> getAllLTeam() async {
    try {
      _dio.options.headers = await getHeaders(false, "");
      Response response = await _dio.get(EndPoints.GET_ALL_TEAM);
      return ListAllTeams.fromJson(response.data);
    } catch (error, stacktrace) {
      print("ERRORRR");
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListAllTeams.withError(Dictionary.warning_dio);
    }
  }

  Future<ListAllTeams> getSarchTeam(String teamSerach) async {
    try {
      _dio.options.headers = await getHeaders(false, "");
      Response response =
          await _dio.get(EndPoints.GET_SEARCH_TEAM + teamSerach);
      return ListAllTeams.fromJson(response.data);
    } catch (error, stacktrace) {
      print("ERRORRR");
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListAllTeams.withError(Dictionary.warning_dio);
    }
  }

  Future<ListEventLeague> getEventLeague(String idLeague) async {
    try {
      _dio.options.headers = await getHeaders(false, "");
      Response response = await _dio.get(EndPoints.GET_EVENT_LEAGUE + idLeague);
      return ListEventLeague.fromJson(response.data);
    } catch (error, stacktrace) {
      print("ERRORRR");
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListEventLeague.withError(Dictionary.warning_dio);
    }
  }

  Future getHeaders(bool isContainBearer, String token) async {
    Map<String, String> header = {};
    header.clear();
    if (isContainBearer) {
      return header = {"Accept": "application/json", "x-auth-token": token};
    } else {
      return header = {
        "Accept": "application/json",
      };
    }
  }
}
