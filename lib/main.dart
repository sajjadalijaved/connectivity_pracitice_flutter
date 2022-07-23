import 'package:connectivity_practice/bloc/connectivity_bloc.dart';
import 'package:connectivity_practice/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(),
          child: const MyHomePage(),
        ));
  }
}
