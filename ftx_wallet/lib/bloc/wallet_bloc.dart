import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/repository/ftx_wallet_repository_impl.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';
import 'package:ftx_wallet/domain/usecases/fetch_balance_usecase.dart';
import 'package:ftx_wallet/domain/usecases/get_deposit_history_usecase.dart';
import 'package:meta/meta.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletRepository _walletRepository;
  FetchBalanceUseCase _fetchBalanceUseCase;
  GetDeposiHistoryUseCase _getDeposiHistoryUseCase;

  WalletBloc() : super(WalletInitial()) {
    _walletRepository = FtxWalletRepositoryImpl();
    _fetchBalanceUseCase = FetchBalanceUseCase(_walletRepository);
    _getDeposiHistoryUseCase = GetDeposiHistoryUseCase(_walletRepository);
  }

  @override
  Stream<WalletState> mapEventToState(
    WalletEvent event,
  ) async* {
    if (event is GetBalance) {
      print("[Edward-bloc] GetBalance Event");
      final failureOrTrivia = await _fetchBalanceUseCase(NoParams());
      yield failureOrTrivia.fold((failure) => WalletError(failure.message),
          (ftxCoins) => WalletLoaded(ftxCoins));
    }

    if (event is GetDepositHistory) {
      print("[Edward-bloc] GetDepositHistory Event");
      final failureOrSuccess = await _getDeposiHistoryUseCase(NoParams());
      yield failureOrSuccess.fold((failure) => WalletError(failure.message),
          (ftxDepositHistory) => WalletDepositHistoryLoaded(ftxDepositHistory));
    }
  }
}
