import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/src/bloc/events_league_bloc/events_league_bloc.dart';
import 'package:football_app/src/models/list_event_league.dart';
import 'package:football_app/src/utils/components/custom_shimmer.dart';

class ScheduleEventLeaguePage extends StatefulWidget {
  final String idLeague;
  const ScheduleEventLeaguePage({Key key, this.idLeague}) : super(key: key);

  @override
  _ScheduleEventLeaguePageState createState() =>
      _ScheduleEventLeaguePageState();
}

class _ScheduleEventLeaguePageState extends State<ScheduleEventLeaguePage> {
  EventsLeagueBloc _eventsLeagueBloc = EventsLeagueBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "League England Foot ball",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<EventsLeagueBloc>(
                create: (context) =>
                    _eventsLeagueBloc..add(EventsStarted(widget.idLeague)),
              ),
            ],
            child: BlocConsumer<EventsLeagueBloc, EventsLeagueState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is EventsLeagueLoaded) {
                  return _buildList(state.listDataEventLeague);
                } else if (state is EventsLeagueProgress) {
                  return CustomShimmer.loadingListVertical(100);
                } else {
                  return Container();
                }
              },
            )));
  }

  Widget _buildList(List<DataEventLeague> listDataEventLeague) {
    return ListView.builder(
      itemCount: listDataEventLeague.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    // height: 70,
                    // width: 400,
                    child: CachedNetworkImage(
                      width: 400,
                      height: 100,
                      fit: BoxFit.cover,
                      imageUrl: listDataEventLeague[index].strThumb != null
                          ? "${listDataEventLeague[index].strThumb}"
                          : "https://hidupbanjaran.com/assets/images/notfound.png",
                      placeholder: (context, url) => Center(
                          child: new CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      )),
                      errorWidget: (context, url, error) => Image.network(
                        "https://hidupbanjaran.com/assets/images/notfound.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      listDataEventLeague[index].strEvent != null
                          ? listDataEventLeague[index].strEvent
                          : "data tidak ada" ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Text(
                            '${"Home Score : " + listDataEventLeague[index].intHomeScore ?? 'data tidak ada'}, ${"Round Score : " + listDataEventLeague[index].intRound ?? 'data tidak ada'}, ${"Away Score : " + listDataEventLeague[index].intAwayScore ?? 'data tidak ada'}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${listDataEventLeague[index].strEvent ?? 'data tidak ada'}, ${listDataEventLeague[index].dateEvent ?? 'data tidak ada'}, ${listDataEventLeague[index].strTimeLocal + " WIB" ?? 'data tidak ada'}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
