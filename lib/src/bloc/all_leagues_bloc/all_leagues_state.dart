part of 'all_leagues_bloc.dart';

@immutable
abstract class AllLeaguesState {}

class AllLeaguesInitial extends AllLeaguesState {}

class AllLeaguesSuccess extends AllLeaguesState {
  final List<DataLeagues> listDataLeagues;

  AllLeaguesSuccess(this.listDataLeagues);
}

class AllLeaguesProgress extends AllLeaguesState {}

class AllLeaguesFailure extends AllLeaguesState {}
