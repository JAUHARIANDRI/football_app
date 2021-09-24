class ListAllTeams {
  List<DataAllTeams> dataAllTeam;

  String error;
  ListAllTeams({this.dataAllTeam, this.error});

  ListAllTeams.withError(String errorMessage) {
    error = errorMessage;
  }

  factory ListAllTeams.fromJson(Map<String, dynamic> json) => ListAllTeams(
        dataAllTeam: json["teams"] == null
            ? null
            : List<DataAllTeams>.from(
                json["teams"].map((x) => DataAllTeams.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teams": dataAllTeam == null
            ? null
            : List<dynamic>.from(dataAllTeam.map((x) => x.toJson())),
      };
}

class DataAllTeams {
  String idTeam;
  String strTeam;
  String strCountry;
  String strTeamBadge;
  String intFormedYear;

  DataAllTeams(
      {this.idTeam,
      this.strTeam,
      this.strCountry,
      this.strTeamBadge,
      this.intFormedYear});

  factory DataAllTeams.fromJson(Map<String, dynamic> json) => DataAllTeams(
        idTeam: json["idTeam"] == null || json["idTeam"] == ''
            ? null
            : json["idTeam"],
        strTeam: json["strTeam"] == null || json["strTeam"] == ''
            ? null
            : json["strTeam"],
        strCountry: json["strCountry"] == null || json["strCountry"] == ''
            ? null
            : json["strCountry"],
        strTeamBadge: json["strTeamBadge"] == null || json["strTeamBadge"] == ''
            ? null
            : json["strTeamBadge"],
        intFormedYear:
            json["intFormedYear"] == null || json["intFormedYear"] == ''
                ? null
                : json["intFormedYear"],
      );

  Map<String, dynamic> toJson() => {
        "idTeam": idTeam == null ? null : idTeam,
        "strTeam": strTeam == null ? null : strTeam,
        "strCountry": strCountry == null ? null : strCountry,
        "strTeamBadge": strTeamBadge == null ? null : strTeamBadge,
        "intFormedYear": intFormedYear == null ? null : intFormedYear,
      };
}
