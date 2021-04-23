
import 'package:ftx_wallet/core/helper/account_info_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountInfoCheckerImpl implements AccountInfoChecker {

  static const SUBACCOUT_UPDATE_TIME = "subaccount_update_time";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AccountInfoCheckerImpl() {}


  @override
  Future<bool> isUpdateAccountInfo() async {
    final SharedPreferences prefs = await _prefs;
    var lastUpdatedTime = prefs.get(SUBACCOUT_UPDATE_TIME);
    if (lastUpdatedTime == null) {
      return true;
    }
    var lastUpdatedDateTime = DateTime.parse(prefs.get(SUBACCOUT_UPDATE_TIME));
    DateTime oneDayBeforeNow = DateTime.now().subtract(Duration(days: 1));
    if (oneDayBeforeNow.isAfter(lastUpdatedDateTime)) {
      return true;
    }
    return false;
  }

  @override
  Future<void> updateSyncTime(DateTime dateTime) async {
    final SharedPreferences prefs = await _prefs;
    if (dateTime == null) {
      prefs.setString(SUBACCOUT_UPDATE_TIME, null);
      return;
    }
    prefs.setString(SUBACCOUT_UPDATE_TIME, dateTime.toString());
  }


}