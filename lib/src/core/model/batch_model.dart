import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BatchModel extends Equatable {
  final String? id;
  final String productName;
  final DateTime productionDate;
  final int quantity;

  const BatchModel(
      { this.id,
      required this.productName,
      required this.productionDate,
      required this.quantity});

  factory BatchModel.fromMap(Map<String, dynamic> map, String id) => BatchModel(
      id: id,
      productName: map['productName'],
      productionDate: (map['productionDate'] as Timestamp).toDate(),
      quantity: map['quantity']);

  Map<String, dynamic> toMap() => {
        'productName': productName,
        'productionDate': Timestamp.fromDate(productionDate),
        'quantity': quantity,
      };

  @override
  List<Object?> get props => [];
}
