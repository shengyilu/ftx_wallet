import 'package:ftx_wallet/data/datasources/local/model/ftx_deposit_history_local.dart';
import 'package:ftx_wallet/data/datasources/local/model/ftx_withdrawal_history_local.dart';
import 'package:ftx_wallet/data/model/ftx_deposit_history.dart';
import 'package:ftx_wallet/data/model/ftx_withdrawal_history.dart';
import 'package:hive/hive.dart';

import 'hive_helper.dart';

class HiveHelperImpl extends HiveHelper {

  static const SUBACCOUT_BOX = "subaccount";
  static const DEPOSIT_PREFIX = "deposit-";
  static const WITHDRAWAL_PREFIX = "withdrawal-";

  @override
  Future<void> saveSubaccounts(List<String> subaccounts) async {
    await Hive.openBox(SUBACCOUT_BOX);
    var box = Hive.box(SUBACCOUT_BOX);
    await box.clear();
    subaccounts.forEach((subaccount) {
      box.add(subaccount);
    });
  }

  @override
  Future<List<String>> getSubaccounts() async {
    var box = await Hive.openBox<String>(SUBACCOUT_BOX);
    var subaccounts = box.values.toList();
    return subaccounts;
  }

  @override
  Future<void> saveDepositHistory(Map<String, List<FtxDepositHistory>> deposits) {
    print("[Edward] saveDepositHistory:${deposits}");
    deposits.forEach((subaccount, deposits) async {
      var boxName = "$DEPOSIT_PREFIX$subaccount";
      await Hive.openBox(boxName);
      var box = Hive.box(boxName);
      await box.clear();
      deposits.forEach((deposit) {
        FtxDepositHistoryLocal depositLocal = FtxDepositHistoryLocal(
            deposit.coin,
            deposit.confirmations,
            deposit.confirmedTime,
            deposit.fee,
            deposit.id,
            deposit.sentTime,
            deposit.size,
            deposit.status,
            deposit.time,
            deposit.txid);

        box.add(depositLocal);
      });
    });
  }

  @override
  Future<Map<String, List<FtxDepositHistory>>> getDepositHistory(String subaccount) async {
    var boxName = "$DEPOSIT_PREFIX$subaccount";
    var box = await Hive.openBox<FtxDepositHistoryLocal>(boxName);
    var ftxDepositHistoryLocals = box.values.toList();
    List<FtxDepositHistory> ftxDepositHistories = [];
    ftxDepositHistoryLocals.forEach((ftxDepositHistoryLocal) {
      var ftxDepositHistory = FtxDepositHistory((b) => b
        ..coin = ftxDepositHistoryLocal.coin
        ..confirmations = ftxDepositHistoryLocal.confirmations
        ..confirmedTime = ftxDepositHistoryLocal.confirmedTime
        ..fee = ftxDepositHistoryLocal.fee
        ..id = ftxDepositHistoryLocal.id
        ..sentTime = ftxDepositHistoryLocal.sentTime
        ..size = ftxDepositHistoryLocal.size
        ..status = ftxDepositHistoryLocal.status
        ..time = ftxDepositHistoryLocal.time
        ..txid = ftxDepositHistoryLocal.txid
      );

      ftxDepositHistories.add(ftxDepositHistory);
    });
    return {subaccount: ftxDepositHistories};
  }

  @override
  Future<Map<String, List<FtxWithdrawalHistory>>> getWithdrawalHistory(String subaccount) async {
    var boxName = "$WITHDRAWAL_PREFIX$subaccount";
    var box = await Hive.openBox<FtxWithdrawalHistoryLocal>(boxName);
    var ftxWithdrawalHistoryLocals = box.values.toList();

    List<FtxWithdrawalHistory> ftxWithdrawalHistories = [];
    ftxWithdrawalHistoryLocals.forEach((ftxWithdrawalHistoryLocal) {
      var ftxWithdrawalHistory = FtxWithdrawalHistory((b) => b
          ..coin = ftxWithdrawalHistoryLocal.coin
          ..address = ftxWithdrawalHistoryLocal.address
          ..confirmedTime = ftxWithdrawalHistoryLocal.confirmedTime
          ..tag = ftxWithdrawalHistoryLocal.tag
          ..fee = ftxWithdrawalHistoryLocal.fee
          ..id = ftxWithdrawalHistoryLocal.id
          ..size = ftxWithdrawalHistoryLocal.size
          ..status = ftxWithdrawalHistoryLocal.status
          ..time = ftxWithdrawalHistoryLocal.time
          ..txid = ftxWithdrawalHistoryLocal.txid
      );
      ftxWithdrawalHistories.add(ftxWithdrawalHistory);
    });

    return {subaccount: ftxWithdrawalHistories};
  }

  @override
  Future<void> saveWithdrawalHistory(Map<String, List<FtxWithdrawalHistory>> withdrawals) {
    withdrawals.forEach((subaccount, withdrawals) async {
      var boxName = "$WITHDRAWAL_PREFIX$subaccount";
      await Hive.openBox(boxName);
      var box = Hive.box(boxName);
      await box.clear();
      withdrawals.forEach((withdrawal) {
        FtxWithdrawalHistoryLocal depositLocal = FtxWithdrawalHistoryLocal(
            withdrawal.coin,
            withdrawal.address,
            withdrawal.confirmedTime,
            withdrawal.tag,
            withdrawal.fee,
            withdrawal.id,
            withdrawal.size,
            withdrawal.status,
            withdrawal.time,
            withdrawal.txid);
        box.add(depositLocal);
      });
    });
  }


  @override
  Future<void> close() async {
    await Hive.close();
  }





}