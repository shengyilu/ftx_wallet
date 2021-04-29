
abstract class AccountInfoChecker {

  static const SUBACCOUT_UPDATE_TIME = "subaccount_update_time";
  static const DEPOSIT_WITHDRAWAL_UPDATE_TIME = "deposit_withdrawal_update_time";

  Future<bool> isUpdateAccountInfo();
  Future<bool> isUpdateDepositWithdrawalHistory();
  Future<void> updateSyncTime(String key, DateTime dateTime);
}
