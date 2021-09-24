class ListEventLeague {
  List<DataEventLeague> dataEventLeague;
  String error;
  ListEventLeague({this.dataEventLeague, this.error});

  ListEventLeague.withError(String errorMessage) {
    error = errorMessage;
  }

  factory ListEventLeague.fromJson(Map<String, dynamic> json) =>
      ListEventLeague(
        dataEventLeague: json["events"] == null
            ? null
            : List<DataEventLeague>.from(
                json["events"].map((x) => DataEventLeague.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": dataEventLeague == null
            ? null
            : List<dynamic>.from(dataEventLeague.map((x) => x.toJson())),
      };
}

class DataEventLeague {
  String strEvent;
  String dateEvent;
  String strTime;
  String strTimeLocal;
  String strThumb;
  String intHomeScore;
  String intRound;
  String intAwayScore;

  DataEventLeague(
      {this.strEvent,
      this.dateEvent,
      this.strTime,
      this.strTimeLocal,
      this.strThumb,
      this.intHomeScore,
      this.intRound,
      this.intAwayScore});

  factory DataEventLeague.fromJson(Map<String, dynamic> json) =>
      DataEventLeague(
        strEvent: json["strEvent"] == null || json["strEvent"] == ''
            ? null
            : json["strEvent"],
        dateEvent: json["dateEvent"] == null || json["dateEvent"] == ''
            ? null
            : json["dateEvent"],
        strTime: json["strTime"] == null || json["strTime"] == ''
            ? null
            : json["strTime"],
        strTimeLocal: json["strTimeLocal"] == null || json["strTimeLocal"] == ''
            ? null
            : json["strTimeLocal"],
        strThumb: json["strThumb"] == null || json["strThumb"] == ''
            ? null
            : json["strThumb"],
        intHomeScore: json["intHomeScore"] == null || json["intHomeScore"] == ''
            ? null
            : json["intHomeScore"],
        intRound: json["intRound"] == null || json["intRound"] == ''
            ? null
            : json["intRound"],
        intAwayScore: json["intAwayScore"] == null || json["intAwayScore"] == ''
            ? null
            : json["intAwayScore"],
      );

  Map<String, dynamic> toJson() => {
        "strEvent": strEvent == null ? null : strEvent,
        "dateEvent": dateEvent == null ? null : dateEvent,
        "strTime": strTime == null ? null : strTime,
        "strTimeLocal": strTimeLocal == null ? null : strTimeLocal,
        "strThumb": strThumb == null ? null : strThumb,
        "intHomeScore": intHomeScore == null ? null : intHomeScore,
        "intRound": intRound == null ? null : intRound,
        "intAwayScore": intAwayScore == null ? null : intAwayScore,
      };
}
