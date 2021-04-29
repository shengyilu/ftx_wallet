
import 'package:ftx_wallet/core/helper/account_info_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountInfoCheckerImpl extends AccountInfoChecker {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AccountInfoCheckerImpl() {}


  @override
  Future<bool> isUpdateAccountInfo() async {
    final SharedPreferences prefs = await _prefs;
    var lastUpdatedTime = prefs.get(AccountInfoChecker.SUBACCOUT_UPDATE_TIME);
    if (lastUpdatedTime == null) {
      return true;
    }
    var lastUpdatedDateTime = DateTime.parse(prefs.get(AccountInfoChecker.SUBACCOUT_UPDATE_TIME));
    DateTime oneDayBeforeNow = DateTime.now().subtract(Duration(days: 1));
    if (oneDayBeforeNow.isAfter(lastUpdatedDateTime)) {
      return true;
    }
    return false;
  }

  @override
  Future<void> updateSyncTime(String key, DateTime dateTime) async {
    final SharedPreferences prefs = await _prefs;
    if (dateTime == null) {
      prefs.setString(key, null);
      return;
    }
    prefs.setString(key, dateTime.toString());
  }

  @override
  Future<bool> isUpdateDepositWithdrawalHistory() async {
    final SharedPreferences prefs = await _prefs;
    var lastUpdatedTime = prefs.get(AccountInfoChecker.DEPOSIT_WITHDRAWAL_UPDATE_TIME);
    if (lastUpdatedTime == null) {
      return true;
    }
    var lastUpdatedDateTime = DateTime.parse(prefs.get(AccountInfoChecker.DEPOSIT_WITHDRAWAL_UPDATE_TIME));
    DateTime oneDayBeforeNow = DateTime.now().subtract(Duration(days: 1));
    if (oneDayBeforeNow.isAfter(lastUpdatedDateTime)) {
      return true;
    }
    return false;
  }


}