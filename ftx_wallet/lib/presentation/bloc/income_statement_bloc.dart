import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/domain/usecases/get_income_statement_usecase.dart';
import 'package:meta/meta.dart';

part 'income_statement_event.dart';
part 'income_statement_state.dart';

class IncomeStatementBloc extends Bloc<IncomeStatementEvent, IncomeStatementState> {

  GetIncomeStatementUsecase _getIncomeStatementUsecase;

  IncomeStatementBloc() : super(IncomeStatementInitial());

  @override
  Stream<IncomeStatementState> mapEventToState(
    IncomeStatementEvent event,
  ) async* {
    if (event is GetIncomeStatementEvent) {
      print("[Edward-bloc] GetIncomeStatementEvent Event");
      final failureOrTrivia = await _getIncomeStatementUsecase(NoParams());
      yield failureOrTrivia.fold(
              (failure) => IncomeStatementError(failure.message),
              (incomeStatement) => IncomeStatementLoaded());
    }
  }
}
