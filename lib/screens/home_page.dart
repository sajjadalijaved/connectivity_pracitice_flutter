import 'package:connectivity_practice/bloc/connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'dart:html';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ConnectivityBloc connectivityBloc =
        Provider.of<ConnectivityBloc>(context, listen: false);
    return Scaffold(
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        bloc: connectivityBloc,
        builder: (_, state) {
          if (state is ConnectState) {
            return connectUI();
          }
          {
            return disconnectUI();
          }
        },
      ),
    );
  }

  Widget connectUI() {
    return const Center(
        child: Image(
      image: AssetImage('assets/connect.gif'),
    ));
  }

  Widget disconnectUI() {
    return const Center(
      child: Image(image: AssetImage('assets/disconnect.gif')),
    );
  }
}
