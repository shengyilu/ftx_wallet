import 'package:flutter/foundation.dart';

class IncomeStatement {
  final String accountName;
  final double totalNetUsd;
  final double depositUsd;


  static Map<String, String> getColumnName() {
    return {
      'accountName': 'Account',
      'totalNetUsd': 'Total Value',
      'depositUsd': 'Deposit Value'
    };
    //statement(s)
  }

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const IncomeStatement({
    @required this.accountName,
    @required this.totalNetUsd,
    @required this.depositUsd,
  });

  IncomeStatement copyWith({
    String accountName,
    double totalNetUsd,
    double depositUsd,
  }) {
    if ((accountName == null || identical(accountName, this.accountName)) &&
        (totalNetUsd == null || identical(totalNetUsd, this.totalNetUsd)) &&
        (depositUsd == null || identical(depositUsd, this.depositUsd))) {
      return this;
    }

    return new IncomeStatement(
      accountName: accountName ?? this.accountName,
      totalNetUsd: totalNetUsd ?? this.totalNetUsd,
      depositUsd: depositUsd ?? this.depositUsd,
    );
  }

  @override
  String toString() {
    return 'IncomeStatement{accountName: $accountName, totalNetUsd: $totalNetUsd, depositUsd: $depositUsd}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeStatement &&
          runtimeType == other.runtimeType &&
          accountName == other.accountName &&
          totalNetUsd == other.totalNetUsd &&
          depositUsd == other.depositUsd);

  @override
  int get hashCode =>
      accountName.hashCode ^ totalNetUsd.hashCode ^ depositUsd.hashCode;

  factory IncomeStatement.fromMap(Map<String, dynamic> map) {
    return new IncomeStatement(
      accountName: map['accountName'] as String,
      totalNetUsd: map['totalNetUsd'] as double,
      depositUsd: map['depositUsd'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'accountName': this.accountName,
      'totalNetUsd': this.totalNetUsd,
      'depositUsd': this.depositUsd,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
