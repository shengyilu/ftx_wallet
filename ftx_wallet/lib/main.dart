import 'package:flutter/material.dart';
import 'package:ftx_wallet/presentation/page/income_statement_page.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  _setupLogging();
  runApp(MyApp());
  _initDatabase();
}

Future<void> _initDatabase() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: IncomeStatementPage(title: 'Income Statement'),
    );
  }
}
