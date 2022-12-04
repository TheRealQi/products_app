import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Services {
  final authentication = FirebaseAuth.instance;
  final cloud = FirebaseFirestore.instance;
  final data = FirebaseDatabase.instance;
}