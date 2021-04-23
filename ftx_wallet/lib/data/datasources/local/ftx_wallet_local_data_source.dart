import 'package:ftx_wallet/core/helper/hive_helper.dart';
import 'package:ftx_wallet/core/helper/hive_helper_impl.dart';

abstract class FtxWalletLocalDataSource {

  Future<List<String>> getAllSubaccounts();
}


class FtxWalletLocalDataSourceImpl implements FtxWalletLocalDataSource {

  HiveHelper _hiveHelper;

  FtxWalletLocalDataSourceImpl() {
    _hiveHelper = HiveHelperImpl();
  }

  @override
  Future<List<String>> getAllSubaccounts() {
    // TODO: implement getAllSubaccounts
    throw UnimplementedError();
  }


}