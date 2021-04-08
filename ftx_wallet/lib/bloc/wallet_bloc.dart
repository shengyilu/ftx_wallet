import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/repository/ftx_wallet_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final FtxWalletRepository _ftxWalletRepository;

  WalletBloc(this._ftxWalletRepository) : super(WalletInitial());

  @override
  Stream<WalletState> mapEventToState(
    WalletEvent event,
  ) async* {
    if (event is GetBalance) {
      print("[Edward] GetBalance Event");
      final response = await _ftxWalletRepository.fetchBalance();
      yield WalletLoaded(response.body);
    }
  }
}
