import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasServices{
static final _firestore = FirebaseFirestore.instance;


static CollectionReference get batch => _firestore.collection('batch');


}