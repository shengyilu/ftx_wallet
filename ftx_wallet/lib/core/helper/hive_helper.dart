
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';

abstract class HiveHelper {
  Future<void> saveSubaccounts(List<String> subaccounts);
  Future<List<String>> getSubaccounts();
  Future<void> saveDepositHistory(Map<String, List<FtxDepositHistory>> deposits);
  Future<Map<String, List<FtxDepositHistory>>> getDepositHistory(String subaccount);
  Future<void> saveWithdrawalHistory(Map<String, List<FtxWithdrawalHistory>> withdrawals);
  Future<Map<String, List<FtxWithdrawalHistory>>> getWithdrawalHistory(String subaccount);

  Future<void> close();
}
