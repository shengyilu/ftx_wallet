import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/repository/ftx_wallet_repository_impl.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';
import 'package:ftx_wallet/domain/usecases/get_income_statement_usecase.dart';
import 'package:meta/meta.dart';

part 'income_statement_event.dart';
part 'income_statement_state.dart';

class IncomeStatementBloc extends Bloc<IncomeStatementEvent, IncomeStatementState> {

  WalletRepository _walletRepository;
  GetIncomeStatementUsecase _getIncomeStatementUsecase;

  IncomeStatementBloc() : super(IncomeStatementInitial()) {
    this._walletRepository = FtxWalletRepositoryImpl();
    this._getIncomeStatementUsecase = GetIncomeStatementUsecase(_walletRepository);
  }

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
