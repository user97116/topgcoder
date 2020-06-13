import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/providers/todo.dart';

class FirestoreService {
  static FirestoreService _firestoreService = FirestoreService._();
  Firestore firestore = Firestore.instance;

  factory FirestoreService.getInstance() {
    return _firestoreService;
  }
  FirestoreService._();

  addCategory(Category category) {
    firestore.collection("categories").add(category.toMap());
  }

  updateCategory(catId, Category category) async {
    QuerySnapshot querySnapshot = await firestore
        .collection("categories")
        .where("id", isEqualTo: catId)
        .getDocuments();
    var documentID = querySnapshot.documents[0].documentID;
    await firestore
        .collection("categories")
        .document(documentID)
        .updateData(category.toMap());
  }

  removeCategory(catId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection("categories")
        .where("id", isEqualTo: catId)
        .getDocuments();
    var documentID = querySnapshot.documents[0].documentID;
    await firestore.collection("categories").document(documentID).delete();
  }
}
