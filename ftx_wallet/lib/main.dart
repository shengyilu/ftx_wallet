import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/repository/ftx_wallet_repository.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'bloc/wallet_bloc.dart';
import 'data/api/wallet/ftx_wallet_api_service.dart';
import 'data/model/serializers.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WalletBloc(FtxWalletRepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    final walletBloc = context.read<WalletBloc>();
    walletBloc.add(GetBalance());
    return;
    // final response =
    //     await Provider.of<FtxWalletApiService>(context, listen: false)
    //     .getBalance();
    // print(response.body[0]);
    // print(response.body[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            final state = context.watch<WalletBloc>().state;
            if (state is WalletLoaded) {
              final ftxCoins = state.ftxCoins;
              print(ftxCoins);
            } else {
              print(state);
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Edward',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
