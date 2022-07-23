import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _streamSubscription;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectEvent>((event, emit) {
      emit.call(ConnectState(event.connectivityResult));
    });
    on<DisconnectEvent>((event, emit) => emit.call(DisconnectState()));
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        add(DisconnectEvent());
      } else {
        add(ConnectEvent(result));
      }
    });
  }
  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
