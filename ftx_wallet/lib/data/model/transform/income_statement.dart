import 'package:flutter/foundation.dart';

class IncomeStatement {
  final String accountName;
  final double totalNetUsd;
  final double depositUsd;
  final double latestFundingPayment;
  final double totalFundingPayment;

  static Map<String, String> getColumnName() {
    return {
      'accountName': 'Account',
      'totalNetUsd': 'Total Value',
      'depositUsd': 'Deposit Value',
      'latestFundingPayment': 'Latest Payment',
      'totalFundingPayment': 'Total Payment',
    };
    //statement(s)
  }

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const IncomeStatement({
    @required this.accountName,
    @required this.totalNetUsd,
    @required this.depositUsd,
    @required this.latestFundingPayment,
    @required this.totalFundingPayment,
  });

  IncomeStatement copyWith({
    String accountName,
    double totalNetUsd,
    double depositUsd,
    double latestFundingPayment,
    double totalFundingPayment,
  }) {
    if ((accountName == null || identical(accountName, this.accountName)) &&
        (totalNetUsd == null || identical(totalNetUsd, this.totalNetUsd)) &&
        (depositUsd == null || identical(depositUsd, this.depositUsd)) &&
        (latestFundingPayment == null ||
            identical(latestFundingPayment, this.latestFundingPayment)) &&
        (totalFundingPayment == null ||
            identical(totalFundingPayment, this.totalFundingPayment))) {
      return this;
    }

    return new IncomeStatement(
      accountName: accountName ?? this.accountName,
      totalNetUsd: totalNetUsd ?? this.totalNetUsd,
      depositUsd: depositUsd ?? this.depositUsd,
      latestFundingPayment: latestFundingPayment ?? this.latestFundingPayment,
      totalFundingPayment: totalFundingPayment ?? this.totalFundingPayment,
    );
  }

  @override
  String toString() {
    return 'IncomeStatement{accountName: $accountName, totalNetUsd: $totalNetUsd, depositUsd: $depositUsd, latestFundingPayment: $latestFundingPayment, totalFundingPayment: $totalFundingPayment}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeStatement &&
          runtimeType == other.runtimeType &&
          accountName == other.accountName &&
          totalNetUsd == other.totalNetUsd &&
          depositUsd == other.depositUsd &&
          latestFundingPayment == other.latestFundingPayment &&
          totalFundingPayment == other.totalFundingPayment);

  @override
  int get hashCode =>
      accountName.hashCode ^
      totalNetUsd.hashCode ^
      depositUsd.hashCode ^
      latestFundingPayment.hashCode ^
      totalFundingPayment.hashCode;

  factory IncomeStatement.fromMap(Map<String, dynamic> map) {
    return new IncomeStatement(
      accountName: map['accountName'] as String,
      totalNetUsd: map['totalNetUsd'] as double,
      depositUsd: map['depositUsd'] as double,
      latestFundingPayment: map['latestFundingPayment'] as double,
      totalFundingPayment: map['totalFundingPayment'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'accountName': this.accountName,
      'totalNetUsd': this.totalNetUsd,
      'depositUsd': this.depositUsd,
      'latestFundingPayment': this.latestFundingPayment,
      'totalFundingPayment': this.totalFundingPayment,
    } as Map<String, dynamic>;
  }
//</editor-fold>

}
