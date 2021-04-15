part of 'income_statement_bloc.dart';

@immutable
abstract class IncomeStatementEvent {}

class GetBalance extends IncomeStatementEvent {
}

class GetIncomeStatementEvent extends IncomeStatementEvent {
}