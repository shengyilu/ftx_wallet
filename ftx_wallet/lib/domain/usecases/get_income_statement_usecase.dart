

import 'package:dartz/dartz.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_coin.dart';
import 'package:ftx_wallet/data/model/transform/income_statement.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class GetIncomeStatementUsecase implements UseCase<List<IncomeStatement>, NoParams> {

  final WalletRepository _repository;

  GetIncomeStatementUsecase(this._repository);

  @override
  Future<Either<Failure, List<IncomeStatement>>> call(NoParams params) async {


    return null;
  }

}