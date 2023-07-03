// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future batchDelete(
  String collectionName,
  String fieldName,
  String dataName,
  String field2,
  String data2,
) async {
  WriteBatch batch = FirebaseFirestore.instance.batch();
  FirebaseFirestore.instance
      .collection(collectionName)
      .where(fieldName, isEqualTo: dataName)
      .where(field2, isEqualTo: data2)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((document) {
      batch.delete(document.reference);
    });
    return batch.commit();
  });
  // Add your function code here!
}
