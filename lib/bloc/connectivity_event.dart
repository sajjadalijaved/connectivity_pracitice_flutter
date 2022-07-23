part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent {}

class ConnectEvent extends ConnectivityEvent {
  final ConnectivityResult connectivityResult;
  ConnectEvent(this.connectivityResult);
}

class DisconnectEvent extends ConnectivityEvent {}
