
import 'package:flutter/cupertino.dart';

class IncomeStatement {
  final double totalNetUsd;
  final double depositUsd;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  IncomeStatement({
    @required this.totalNetUsd,
    @required this.depositUsd,
  });

  IncomeStatement copyWith({
    double totalNetUsd,
    double depositUsd,
  }) {
    return new IncomeStatement(
      totalNetUsd: totalNetUsd ?? this.totalNetUsd,
      depositUsd: depositUsd ?? this.depositUsd,
    );
  }

  @override
  String toString() {
    return 'IncomeStatement{totalNetUsd: $totalNetUsd, depositUsd: $depositUsd}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeStatement &&
          runtimeType == other.runtimeType &&
          totalNetUsd == other.totalNetUsd &&
          depositUsd == other.depositUsd);

  @override
  int get hashCode => totalNetUsd.hashCode ^ depositUsd.hashCode;

  factory IncomeStatement.fromMap(Map<String, dynamic> map) {
    return new IncomeStatement(
      totalNetUsd: map['totalNetUsd'] as double,
      depositUsd: map['depositUsd'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'totalNetUsd': this.totalNetUsd,
      'depositUsd': this.depositUsd,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}