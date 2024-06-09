import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker_app_flutter_firebase/src/data/job.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepository {
  FirestoreRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  final FirebaseFirestore _firestore;

  Future<void> addJob(String uid, String title, String company) => _firestore
      .collection('jobs')
      .add({'uid': uid, 'title': title, 'company': company});

  Future<void> updateJob(
          String uid, String jobId, String title, String company) =>
      _firestore
          .doc('jobs/$jobId')
          .update({'uid': uid, 'title': title, 'company': company});

  Query<Job> jobQuery() {
    return _firestore.collection('jobs').withConverter(
          fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!),
          toFirestore: (job, _) => job.toMap(),
        );
  }
}

final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository(firestore: FirebaseFirestore.instance);
});
