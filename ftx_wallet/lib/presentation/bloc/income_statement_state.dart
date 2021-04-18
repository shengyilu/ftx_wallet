part of 'income_statement_bloc.dart';

@immutable
abstract class IncomeStatementState {}

class IncomeStatementInitial extends IncomeStatementState {}

class IncomeStatementLoaded extends IncomeStatementState {
  final List<IncomeStatement> incomeStatement;
  IncomeStatementLoaded(this.incomeStatement);
}

class IncomeStatementError extends IncomeStatementState {
  final String message;
  IncomeStatementError(this.message);
}
