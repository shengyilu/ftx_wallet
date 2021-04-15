import 'package:flutter/foundation.dart';

class IncomeStatement {
  final String coin;
  final double totalNetUsd;
  final double depositUsd;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const IncomeStatement({
    @required this.coin,
    @required this.totalNetUsd,
    @required this.depositUsd,
  });

  IncomeStatement copyWith({
    String coin,
    double totalNetUsd,
    double depositUsd,
  }) {
    if ((coin == null || identical(coin, this.coin)) &&
        (totalNetUsd == null || identical(totalNetUsd, this.totalNetUsd)) &&
        (depositUsd == null || identical(depositUsd, this.depositUsd))) {
      return this;
    }

    return new IncomeStatement(
      coin: coin ?? this.coin,
      totalNetUsd: totalNetUsd ?? this.totalNetUsd,
      depositUsd: depositUsd ?? this.depositUsd,
    );
  }

  @override
  String toString() {
    return 'IncomeStatement{coin: $coin, totalNetUsd: $totalNetUsd, depositUsd: $depositUsd}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeStatement &&
          runtimeType == other.runtimeType &&
          coin == other.coin &&
          totalNetUsd == other.totalNetUsd &&
          depositUsd == other.depositUsd);

  @override
  int get hashCode =>
      coin.hashCode ^ totalNetUsd.hashCode ^ depositUsd.hashCode;

  factory IncomeStatement.fromMap(Map<String, dynamic> map) {
    return new IncomeStatement(
      coin: map['coin'] as String,
      totalNetUsd: map['totalNetUsd'] as double,
      depositUsd: map['depositUsd'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'coin': this.coin,
      'totalNetUsd': this.totalNetUsd,
      'depositUsd': this.depositUsd,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
