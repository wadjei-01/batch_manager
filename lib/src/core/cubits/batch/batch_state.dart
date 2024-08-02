import 'package:bloc_test/src/core/model/batch_model.dart';
import 'package:equatable/equatable.dart';

sealed class BatchState extends Equatable {
  @override
  List<Object> get props => [];
}

class BatchStateInitial extends BatchState {}

class BatchStateLoading extends BatchState {}

class BatchStateSuccess extends BatchState {
  final List<BatchModel> batchList;
  BatchStateSuccess(this.batchList);
  @override
  List<Object> get props => [batchList];
}

class BatchStateFailure extends BatchState {
  final String error;
  BatchStateFailure(this.error);
   @override
  List<Object> get props => [error];
}

class BatchStateCreating extends BatchState {}

class BatchStateCreateSuccess extends BatchState {}

class BatchStateCreateFailure extends BatchState {
  final String error;
  BatchStateCreateFailure(this.error);
   @override
  List<Object> get props => [error];
}
