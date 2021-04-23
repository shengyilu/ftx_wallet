import 'package:hive/hive.dart';

import 'hive_helper.dart';

class HiveHelperImpl extends HiveHelper {

  static const SUBACCOUT_BOX = "subaccount";

  @override
  Future<void> saveSubaccounts(List<String> subaccounts) async {
    await Hive.openBox(SUBACCOUT_BOX);
    var box = Hive.box(SUBACCOUT_BOX);
    await box.clear();

    subaccounts.forEach((subaccount) {
      box.add(subaccount);
    });
    await Hive.close();
  }

  @override
  Future<List<String>> getSubaccounts() async {
    var box = await Hive.openBox<String>(SUBACCOUT_BOX);

    return box.values.toList();
  }




}