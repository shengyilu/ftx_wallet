import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ftx_wallet/core/error/failures.dart';
import 'package:ftx_wallet/core/usecase/usecase.dart';
import 'package:ftx_wallet/data/model/ftx_funding_payment.dart';
import 'package:ftx_wallet/domain/repositories/wallet_repository.dart';

class GetFundingPaymentUsecase
    implements UseCase<Map<String, List<double>>, FundingPaymentParams> {
  final WalletRepository _repository;

  GetFundingPaymentUsecase(this._repository) {}

  @override
  Future<Either<Failure, Map<String, List<double>>>> call(
      FundingPaymentParams params) async {
    var subaccounts = params.allSubaccounts;
    List<Future<Either<Failure, Map<String, List<FtxFundingPayment>>>>>
        futures = [];
    subaccounts.forEach((accountName) async {
      futures.add(_repository.getFundingPayment(accountName));
    });
    final results = await Future.wait(futures);

    var fundingPaymentValueMap = Map<String, List<double>>();
    results.forEach((result) {
      var failureOr = result.fold((failure) => failure, (fundingPaymentMap) {
        fundingPaymentMap.forEach((key, fundingPayments) {
          List<double> payments = [];
          fundingPayments.forEach((fundingPayment) {
            payments.add(fundingPayment.payment);
          });
          fundingPaymentValueMap[key] = payments;
        });
      });
      if (failureOr is Failure) {
        return Left(failureOr);
      }
    });
    return Right(fundingPaymentValueMap);
  }
}

class FundingPaymentParams extends Equatable {
  final List<String> allSubaccounts;
  final String coin;

  FundingPaymentParams({this.allSubaccounts, this.coin});

  @override
  List<Object> get props => [allSubaccounts];
}
