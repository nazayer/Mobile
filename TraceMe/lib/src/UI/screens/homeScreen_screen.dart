import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TraceMe/src/UI/screens/index.dart';

class HomeScreenScreen extends StatefulWidget {
  const HomeScreenScreen({
    Key key,
    @required HomeScreenBloc homeScreenBloc,
  })  : _homeScreenBloc = homeScreenBloc,
        super(key: key);

  final HomeScreenBloc _homeScreenBloc;

  @override
  HomeScreenScreenState createState() {
    return HomeScreenScreenState();
  }
}

class HomeScreenScreenState extends State<HomeScreenScreen> {
  HomeScreenScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
        cubit: widget._homeScreenBloc,
        builder: (
          BuildContext context,
          HomeScreenState currentState,
        ) {
          if (currentState is UnHomeScreenState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorHomeScreenState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
          if (currentState is InHomeScreenState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load() {
    widget._homeScreenBloc.add(LoadHomeScreenEvent());
  }
}
