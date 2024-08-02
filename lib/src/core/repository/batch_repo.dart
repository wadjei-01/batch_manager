import 'package:bloc_test/src/core/model/batch_model.dart';
import 'package:bloc_test/src/core/service/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BatchRepository {
  final _batch = FirebasServices.batch;

  Future<void> uploadBatchItem(BatchModel batchItem) async {
    try {
      await _batch.add(batchItem.toMap());
    } catch (error) {
      throw Exception('Error uploading batch item:$error');
    }
  }

  Future<List<BatchModel>> getBatchItems() async {
    try {
      final snapshot = await _batch.get();
      return snapshot.docs
          .map((QueryDocumentSnapshot document) => BatchModel.fromMap(
              document.data() as Map<String, dynamic>, document.id))
          .toList();
    } catch (error) {
      throw Exception('Error fetching batch items: $error');
    }
  }


    Future<void> updateUser(BatchModel batchItem) async {
    try {
      await _batch.doc(batchItem.id).update(batchItem.toMap());
    } catch (e) {
      throw Exception('Error updating batch item: $e');
    }
  }
}
