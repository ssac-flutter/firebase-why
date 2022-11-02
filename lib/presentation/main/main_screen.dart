import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_why/data/model/memo.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Log out'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/write'),
              child: const Text('글쓰기'),
            ),
            Expanded(
              child: FirestoreListView<Memo>(
                query: _query(),
                itemBuilder: (context, snapshot) {
                  final memo = snapshot.data();
                  return ListTile(
                    title: Text(memo.title),
                    subtitle: Text(memo.body),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Query<Memo> _query() {
    return FirebaseFirestore.instance
        .collection('memos')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid ?? '')
        .withConverter<Memo>(
          fromFirestore: (snapshot, _) => Memo.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }
}
