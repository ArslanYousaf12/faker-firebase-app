import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker_app_flutter_firebase/src/data/job.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepository {
  FirestoreRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  final FirebaseFirestore _firestore;

  Future<void> addJob(String uid, String title, String company) =>
      _firestore.collection('users/$uid/jobs').add({
        'uid': uid,
        'title': title,
        'company': company,
        'createdAt': FieldValue.serverTimestamp(),
      });

  Future<void> updateJob(
          String uid, String jobId, String title, String company) =>
      _firestore
          .doc('users/$uid/jobs/$jobId')
          .update({'uid': uid, 'title': title, 'company': company});
  Future<void> deleteJob(String uid, String jobId) =>
      _firestore.doc('users/$uid/jobs/$jobId').delete();

  Query<Job> jobQuery(String uid) {
    return _firestore
        .collection('users/$uid/jobs')
        .withConverter(
          fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!),
          toFirestore: (job, _) => job.toMap(),
        )
        .orderBy('createdAt', descending: true);
  }
}

final firestoreRepositoryProvider = Provider<FirestoreRepository>((ref) {
  return FirestoreRepository(firestore: FirebaseFirestore.instance);
});
