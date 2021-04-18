import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/presentation/bloc/income_statement_bloc.dart';

class IncomeStatementPage extends StatefulWidget {
  final String title;

  IncomeStatementPage({Key key, this.title}) : super(key: key);

  @override
  _IncomeStatementPageState createState() => _IncomeStatementPageState();
}

class _IncomeStatementPageState extends State<IncomeStatementPage> {
  void _test(BuildContext context) async {
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
                  return createDataTable(context);
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

  Widget createDataTable(BuildContext context) {
    final state = context.watch<IncomeStatementBloc>().state;
    if (state is IncomeStatementLoaded) {}

    return DataTable(
      // Use the default value.,
      columns: [
        DataColumn(label: Text('Coin')),
        DataColumn(label: Text('Total Value')),
        DataColumn(label: Text('Deposit Value')),
      ],
      rows: [
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }
}
