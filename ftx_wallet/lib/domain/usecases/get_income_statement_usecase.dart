import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class GetIncomeStatementUsecase
    implements UseCase<List<IncomeStatement>, NoParams> {
  final WalletRepository _repository;

  GetIncomeStatementUsecase(this._repository);

  @override
  Future<Either<Failure, List<IncomeStatement>>> call(NoParams params) async {

    var all_balance = await _repository.getAllBalances();
    print("[Edward-usecase] all_balance: ${all_balance}");

    var is1 =
        IncomeStatement(coin: "Edward", totalNetUsd: 100.0, depositUsd: 33.0);
    var is2 =
        IncomeStatement(coin: "Chaiy", totalNetUsd: 990.0, depositUsd: 311.0);
    List<IncomeStatement> incomeStatements = [is1, is2];

    return Right(incomeStatements);
  }

  Future<Either<Failure, List<String>>> _getSubaccount() async {

    (await _repository.getAllSubaccounts()).fold(
            (failure) {
              return failure;
            },
            (subaccounts) {
              subaccounts.forEach((element) {

              });

            });

  }


  Future<Map<String, List<FtxDepositHistory>>> _getAllDepositHistory() async {
    var deposits = Map<String, List<FtxDepositHistory>>();
    var subaccounts = await _repository.getAllSubaccounts();
    subaccounts.fold(
            (failure) => null,
            (subaccounts) => null);
    subaccounts.forEach((r) {

    });

    return deposits;
  }

}
