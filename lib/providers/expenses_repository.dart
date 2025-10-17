import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense_item.dart';

class ExpensesRepository {
  final FirebaseFirestore _db;
  ExpensesRepository(this._db);

  CollectionReference<Map<String, dynamic>> _col([String groupId = 'default']) =>
      _db.collection('groups').doc(groupId).collection('expenses');

  Stream<List<ExpenseItem>> watch({String groupId = 'default'}) {
    return _col(groupId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => ExpenseItem.fromDoc(d.id, d.data()))
            .toList());
  }

  Future<void> add({
    String groupId = 'default',
    required String product,
    required double amount,
    required String person,
  }) {
    return _col(groupId).add({
      'producto': product.trim(),
      'precio': amount,
      'persona': person.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> remove(String id, {String groupId = 'default'}) =>
      _col(groupId).doc(id).delete();

  Future<void> clear({String groupId = 'default'}) async {
    final batch = _db.batch();
    final q = await _col(groupId).get();
    for (final d in q.docs) {
      batch.delete(d.reference);
    }
    await batch.commit();
  }
}

// Providers
final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final expensesRepoProvider = Provider<ExpensesRepository>((ref) {
  return ExpensesRepository(ref.watch(firestoreProvider));
});

final expensesStreamProvider =
    StreamProvider.autoDispose<List<ExpenseItem>>((ref) {
  return ref.watch(expensesRepoProvider).watch();
});
