part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectState extends ConnectivityState {
  final ConnectivityResult connectivityResult;
  ConnectState(this.connectivityResult);
}

class DisconnectState extends ConnectivityState {}
