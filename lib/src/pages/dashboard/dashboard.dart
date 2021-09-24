import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/src/bloc/all_leagues_bloc/all_leagues_bloc.dart';
import 'package:football_app/src/bloc/club_item_bloc/club_team_bloc.dart';
import 'package:football_app/src/models/list_club.dart';
import 'package:football_app/src/utils/components/custom_shimmer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:football_app/src/utils/components/custom_textfield.dart';
import 'package:football_app/src/utils/components/custom_toast.dart';
import 'package:football_app/src/utils/values/colors.dart';
import 'package:football_app/src/utils/values/dimens.dart';
import 'package:football_app/src/utils/values/strings.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  ClubTeamBloc _clubTeamBloc = ClubTeamBloc();
  TextEditingController _contKeyword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ClubTeamBloc>(
            create: (context) => _clubTeamBloc..add(ClubTeamStarted()),
          ),
        ],
        child: Container(
          child: Stack(
            children: <Widget>[
              NotificationListener<ScrollNotification>(
                child: RefreshIndicator(
                  onRefresh: () async {
                    _clubTeamBloc..add(ClubTeamStarted());
                    return await Future.delayed(Duration(seconds: 2));
                  },
                  child: BlocConsumer<ClubTeamBloc, ClubTeamState>(
                    listener: (context, state) {
                      if (state is ClubSearchTeamLoaded) {
                        return _buildSearchItem(state.listDataAllTeam);
                      } else if (state is ClubSearchTeamEmpty) {
                        return ToastFlush.error(
                            context: context,
                            message: Dictionary.warning_empty_list);
                      }
                    },
                    builder: (context, state) {
                      if (state is ClubAllTeamLoaded) {
                        return _buildAllLeagues(state.listDataAllTeam);
                      } else if (state is AllLeaguesProgress) {
                        return CustomShimmer.loadingListVertical(100);
                      } else if (state is ClubSearchTeamLoaded) {
                        return _buildSearchItem(state.listDataAllTeam);
                      } else if (state is ClubSearchTeamEmpty) {
                        return _buildEmpty();
                      } else {
                        return CustomShimmer.loadingListVertical(100);
                      }
                    },
                  ),
                ),
              ),
              _buildSearchBarCustom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/empty.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(height: marginMedium),
              Text(
                Dictionary.warning_empty_list,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBarCustom() => PreferredSize(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,

          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                        top: 0, left: marginSmall, right: marginSmall),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Football League",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    padding: EdgeInsets.only(
                      top: 10.0,
                      right: 8.0,
                      bottom: 10.0,
                    ),
                    child: InkWell(
                      child: TextField(
                        controller: _contKeyword,
                        readOnly: false,
                        autofocus: false,
                        decoration: TextFieldCustom.searchBar(
                            Dictionary.desc_search, () {
                          _clubTeamBloc
                              .add(ClubTeamSearchStarted(_contKeyword.text));
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ),
          // ),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      );

  Widget _buildAllLeagues(List<DataAllTeams> listTeam) => Padding(
        padding: const EdgeInsets.only(top: 92),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(marginActivity),
            height: MediaQuery.of(context).size.height * 2.5,
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
                return listTeam[index].strTeam == "more"
                    ? InkWell(
                        onTap: () {},
                        child: Card(
                          color: primaryColor,
                          child: Container(
                              margin: EdgeInsets.all(marginSmall),
                              child: Text(
                                Dictionary.more_league.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      )
                    : InkWell(
                        onTap: () {},
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // direction: Axis.horizontal,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      width: 120,
                                      height: 120,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "${listTeam[index].strTeamBadge}",
                                        placeholder: (context, url) => Center(
                                            child:
                                                new CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                          "https://hidupbanjaran.com/assets/images/notfound.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: marginMicro,
                                      vertical: marginNano),
                                  child: Text(
                                    listTeam[index].strTeam.length >
                                            maxCharItemName
                                        ? '${listTeam[index].strTeam.substring(0, maxCharItemName)}...'
                                        : listTeam[index].strTeam.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: marginMicro,
                                      vertical: marginNano),
                                  child: Text(
                                    listTeam[index].strCountry.length >
                                            maxCharItemName
                                        ? "Country : "
                                            '${listTeam[index].strCountry.substring(0, maxCharItemName)}...'
                                        : "Country : " +
                                            listTeam[index]
                                                .strCountry
                                                .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: marginMicro,
                                      vertical: marginNano),
                                  child: Text(
                                    listTeam[index].strCountry.length >
                                            maxCharItemName
                                        ? "Since : "
                                            '${listTeam[index].intFormedYear.substring(0, maxCharItemName)}...'
                                        : "Since : " +
                                            listTeam[index]
                                                .intFormedYear
                                                .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
              },
              itemCount: listTeam.length,
            ),
          ),
        ),
      );
  Widget _buildSearchItem(List<DataAllTeams> listTeam) => Padding(
        padding: const EdgeInsets.only(top: 92),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(marginActivity),
            height: MediaQuery.of(context).size.height * 2.5,
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
                return listTeam[index].strTeam == "more"
                    ? InkWell(
                        onTap: () {},
                        child: Card(
                          color: primaryColor,
                          child: Container(
                              margin: EdgeInsets.all(marginSmall),
                              child: Text(
                                Dictionary.more_league.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      )
                    : InkWell(
                        onTap: () {},
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // direction: Axis.horizontal,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      width: 120,
                                      height: 120,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "${listTeam[index].strTeamBadge}",
                                        placeholder: (context, url) => Center(
                                            child:
                                                new CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                          "https://hidupbanjaran.com/assets/images/notfound.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: marginMicro,
                                      vertical: marginNano),
                                  child: Text(
                                    listTeam[index].strTeam.length >
                                            maxCharItemName
                                        ? '${listTeam[index].strTeam.substring(0, maxCharItemName)}...'
                                        : listTeam[index].strTeam.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: marginMicro,
                                      vertical: marginNano),
                                  child: Text(
                                    listTeam[index].strCountry.length >
                                            maxCharItemName
                                        ? "Country : "
                                            '${listTeam[index].strCountry.substring(0, maxCharItemName)}...'
                                        : "Country : " +
                                            listTeam[index]
                                                .strCountry
                                                .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: marginMicro,
                                      vertical: marginNano),
                                  child: Text(
                                    listTeam[index].strCountry.length >
                                            maxCharItemName
                                        ? "Since : "
                                            '${listTeam[index].intFormedYear.substring(0, maxCharItemName)}...'
                                        : "Since : " +
                                            listTeam[index]
                                                .intFormedYear
                                                .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
              },
              itemCount: listTeam.length,
            ),
          ),
        ),
      );
}
