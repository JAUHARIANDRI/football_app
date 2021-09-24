import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:football_app/src/bloc/all_leagues_bloc/all_leagues_bloc.dart';
import 'package:football_app/src/models/list_liga.dart';
import 'package:football_app/src/pages/Schedules/sckhedule_detail.dart';
import 'package:football_app/src/utils/components/custom_shimmer.dart';
import 'package:football_app/src/utils/values/dimens.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({Key key}) : super(key: key);

  @override
  _SchedulesPageState createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  AllLeaguesBloc _allLeaguesBloc = AllLeaguesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Schedules",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AllLeaguesBloc>(
            create: (context) => _allLeaguesBloc..add(AllLeaguesStarted()),
          ),
        ],
        child: BlocConsumer<AllLeaguesBloc, AllLeaguesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AllLeaguesSuccess) {
              return _buildKategori(state.listDataLeagues);
            } else if (state is AllLeaguesProgress) {
              return CustomShimmer.loadingListVertical(100);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildKategori(List<DataLeagues> listDataLeague) =>
      SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(marginActivity),
          height: MediaQuery.of(context).size.height * 1.1,
          width: MediaQuery.of(context).size.width,
          child: StaggeredGridView.countBuilder(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            // ignore: missing_return
            itemBuilder: (BuildContext context, int index) {
              if (listDataLeague[index].strSport == "Soccer") {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ScheduleEventLeaguePage(
                          idLeague: listDataLeague[index].idLeague,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            child: CachedNetworkImage(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              imageUrl: listDataLeague[index].strBadge != null
                                  ? "${listDataLeague[index].strBadge}"
                                  : "https://hidupbanjaran.com/assets/images/notfound.png",
                              placeholder: (context, url) => Center(
                                child: new CircularProgressIndicator(
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                "https://hidupbanjaran.com/assets/images/notfound.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          margin: EdgeInsets.all(marginMicro),
                          child: Text(
                            listDataLeague[index].strLeague,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF2C0769), fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            itemCount: listDataLeague.length,
          ),
        ),
      );
}
