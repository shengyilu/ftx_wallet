part of 'wallet_bloc.dart';


abstract class WalletState {
  const WalletState();
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {

  final List<FtxCoin> ftxCoins;

  const WalletLoaded(this.ftxCoins);
}

class WalletError extends WalletState {
  final String message;
  const WalletError(this.message);
}
