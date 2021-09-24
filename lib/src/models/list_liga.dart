class ListAllLiga {
  List<DataLeagues> dataLeagues;
  String error;

  ListAllLiga({this.dataLeagues, this.error});

  ListAllLiga.withError(String errorMessage) {
    error = errorMessage;
  }

  factory ListAllLiga.fromJson(Map<String, dynamic> json) => ListAllLiga(
        dataLeagues: json["countrys"] == null
            ? null
            : List<DataLeagues>.from(
                json["countrys"].map((x) => DataLeagues.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countrys": dataLeagues == null
            ? null
            : List<dynamic>.from(dataLeagues.map((x) => x.toJson())),
      };
}

class DataLeagues {
  String idLeague;
  String strLeague;
  String strFanart1;
  String strLeagueAlternate;
  String strSport;
  String strBadge;
  DataLeagues(
      {this.idLeague,
      this.strLeague,
      this.strFanart1,
      this.strLeagueAlternate,
      this.strSport,
      this.strBadge});

  factory DataLeagues.fromJson(Map<String, dynamic> json) => DataLeagues(
        idLeague: json["idLeague"] == null || json["idLeague"] == ''
            ? null
            : json["idLeague"],
        strLeague: json["strLeague"] == null || json["strLeague"] == ''
            ? null
            : json["strLeague"],
        strFanart1: json["strFanart1"] == null || json["strFanart1"] == ''
            ? null
            : json["strFanart1"],
        strLeagueAlternate: json["strLeagueAlternate"] == null ||
                json["strLeagueAlternate"] == ''
            ? null
            : json["strLeagueAlternate"],
        strSport: json["strSport"] == null || json["strSport"] == ''
            ? null
            : json["strSport"],
        strBadge: json["strBadge"] == null || json["strBadge"] == ''
            ? null
            : json["strBadge"],
      );

  Map<String, dynamic> toJson() => {
        "idLeague": idLeague == null ? null : idLeague,
        "strLeague": strLeague == null ? null : strLeague,
        "strFanart1": strFanart1 == null ? null : strFanart1,
        "strLeagueAlternate":
            strLeagueAlternate == null ? null : strLeagueAlternate,
        "strSport": strSport == null ? null : strSport,
        "strBadge": strBadge == null ? null : strBadge,
      };
}
