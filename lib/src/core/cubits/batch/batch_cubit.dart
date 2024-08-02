import 'package:bloc/bloc.dart';
import 'package:bloc_test/src/core/cubits/batch/batch_state.dart';
import 'package:bloc_test/src/core/model/batch_model.dart';
import 'package:bloc_test/src/core/repository/batch_repo.dart';
import 'package:flutter/material.dart';

class BatchCubit extends Cubit<BatchState> {
  BatchCubit() : super(BatchStateInitial());

  final _batchRepository = BatchRepository();

  Future<void> createBatchItem(BatchModel batchItem) async {
    emit(BatchStateCreating());
    try {
      _batchRepository.uploadBatchItem(batchItem);
      debugPrint('Logging:>>');
      emit(BatchStateCreateSuccess());
    } catch (e) {
      debugPrint('Upload Batch item error:>> $e');
      emit(BatchStateCreateFailure(
          'Unable to upload batch items at the moment'));
    }
  }

  Future<void> fetchBatchList() async {
    emit(BatchStateLoading());
    try {
      final batchList = await _batchRepository.getBatchItems();

      emit(BatchStateSuccess(batchList));
      debugPrint('Success:>>');
    } catch (e) {
      debugPrint('Fetch batch items error:>> $e');
      emit(BatchStateFailure('Unable to retreive batch items'));
    }
  }
}
