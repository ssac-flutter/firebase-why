import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_why/data/model/memo.dart';
import 'package:flutter/material.dart';

class WriteViewModel extends ChangeNotifier {
  final _memosRef =
      FirebaseFirestore.instance.collection('memos').withConverter<Memo>(
            fromFirestore: (snapshot, _) => Memo.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );

  Query<Memo> get memoQuery => _memosRef;

  Future<void> write(String title, String body) async {
    await _memosRef.add(Memo(
      uid: FirebaseAuth.instance.currentUser?.uid ?? '',
      title: title,
      body: body,
    ));
  }
}
