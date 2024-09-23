import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirebaseDataBase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> crateDailyGlicose() async {
    String formatDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    await _db
        .collection('Users')
        .doc('Mom')
        .collection('Glicose')
        .doc(formatDate)
        .set(
      {
        'manha': 000,
        'tarde': 000,
        'noite': 000,
        'create': formatDate,
      },
    );
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getGlicoseData() {
    String formatDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    return _db
        .collection('Users')
        .doc('Mom')
        .collection('Glicose')
        .doc(formatDate)
        .snapshots();
  }

  Future<void> updateGlicoseField(String field, int newValue) async {
    String formatDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    await _db
        .collection('Users')
        .doc('Mom')
        .collection('Glicose')
        .doc(formatDate)
        .update(
      {
        field: newValue,
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllGLicose() {
    return _db.collection('Users').doc('Mom').collection('Glicose').snapshots();
  }
}
