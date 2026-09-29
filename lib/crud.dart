import 'package:cloud_firestore/cloud_firestore.dart';

/// Service class handling CRUD (Create, Read, Update, Delete) operations
/// and validations for Food items in Firebase Firestore.
class FirestoreService {
  final CollectionReference<Map<String, dynamic>> _foodsCollection =
      FirebaseFirestore.instance.collection('foods');

  /// Check if a food item name already exists in Firestore (case-insensitive).
  /// [excludeDocId] is used during edits to ignore the document being updated.
  Future<bool> isDuplicate(String foodName, {String? excludeDocId}) async {
    final querySnapshot = await _foodsCollection.get();
    final normalized = foodName.trim().toLowerCase();

    for (final doc in querySnapshot.docs) {
      if (excludeDocId != null && doc.id == excludeDocId) {
        continue;
      }
      final existing = (doc.data()['name'] as String? ?? '').trim().toLowerCase();
      if (existing == normalized) {
        return true;
      }
    }
    return false;
  }

  /// CREATE: Add a new food item to Firestore
  Future<void> addFood(String foodName) async {
    final trimmedName = foodName.trim();
    if (trimmedName.isEmpty) return;

    await _foodsCollection.add({
      'name': trimmedName,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// READ: Real-time stream of all food items ordered by creation time
  Stream<QuerySnapshot<Map<String, dynamic>>> getFoodsStream() {
    return _foodsCollection
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  /// UPDATE: Update an existing food item name by document ID
  Future<void> updateFood(String docId, String newName) async {
    final trimmedName = newName.trim();
    if (trimmedName.isEmpty) return;

    await _foodsCollection.doc(docId).update({
      'name': trimmedName,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// DELETE: Remove a food item by document ID
  Future<void> deleteFood(String docId) async {
    await _foodsCollection.doc(docId).delete();
  }
}
