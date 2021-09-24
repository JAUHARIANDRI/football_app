class EndPoints {
  static const String BASE_URL = "https://www.thesportsdb.com/api/v1/json/1/";
  static const String BASE_URL_API = "$BASE_URL";

  static const String GET_ALL_LEAGUES = "search_all_leagues.php?c=England";
  static const String GET_ALL_TEAM =
      "search_all_teams.php?l=English%20Premier%20League";
  static const String GET_EVENT_LEAGUE = "eventspastleague.php?id=";
  static const String GET_SEARCH_TEAM = "searchteams.php?t=";
}
