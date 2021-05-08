import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/presentation/bloc/income_statement_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class IncomeStatementPage extends StatefulWidget {
  final String title;

  IncomeStatementPage({Key key, this.title}) : super(key: key);

  @override
  _IncomeStatementPageState createState() => _IncomeStatementPageState();
}

class _IncomeStatementPageState extends State<IncomeStatementPage> {
  void _test(BuildContext context) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    final bloc = context.read<IncomeStatementBloc>();
    bloc.add(GetIncomeStatementEvent());
    return;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IncomeStatementBloc(),
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
              margin: EdgeInsets.all(10.0),
              child: Builder(
                builder: (BuildContext context) {
                  final state = context.watch<IncomeStatementBloc>().state;
                  if (state is IncomeStatementLoaded) {
                    return createDataTable(state.incomeStatement);
                  }
                  return Text("Nothing to show");
                },
              )),
          floatingActionButton: Builder(builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () => _test(context),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }),
        );
      }),
    );
  }

  List<DataColumn> _createColumn() {
    var columnLables = IncomeStatement.getColumnName();
    var columns = <DataColumn>[];
    columnLables.forEach((key, value) {
      columns.add(DataColumn(
        label: Text(value),
      ));
    });
    return columns;
  }

  List<DataRow> _createRow(List<IncomeStatement> incomeStatements) {
    var columns = <DataRow>[];
    incomeStatements.forEach((incomeStatement) {
      columns.add(DataRow(
        cells: _creaetDataCells(incomeStatement),
      ));
    });
    return columns;
  }

  List<DataCell> _creaetDataCells(IncomeStatement incomeStatement) {
    var cells = <DataCell>[];
    cells.add(DataCell(Text(incomeStatement.accountName)));
    cells.add(DataCell(Text(incomeStatement.totalNetUsd.toStringAsFixed(3))));
    cells.add(DataCell(Text(incomeStatement.depositUsd.toStringAsFixed(3))));
    cells.add(DataCell(
        Text(incomeStatement.latestFundingPayment.toStringAsFixed(3))));
    cells.add(
        DataCell(Text(incomeStatement.totalFundingPayment.toStringAsFixed(3))));
    return cells;
  }

  Widget createDataTable(List<IncomeStatement> incomeStatements) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          // Use the default value.,
          columns: _createColumn(),
          rows: _createRow(incomeStatements),
        ),
      ),
    );
  }
}
