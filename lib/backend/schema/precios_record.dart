import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreciosRecord extends FirestoreRecord {
  PreciosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "pesoMin" field.
  double? _pesoMin;
  double get pesoMin => _pesoMin ?? 0.0;
  bool hasPesoMin() => _pesoMin != null;

  // "pesoMax" field.
  double? _pesoMax;
  double get pesoMax => _pesoMax ?? 0.0;
  bool hasPesoMax() => _pesoMax != null;

  // "lista" field.
  String? _lista;
  String get lista => _lista ?? '';
  bool hasLista() => _lista != null;

  // "carrierUuid" field.
  String? _carrierUuid;
  String get carrierUuid => _carrierUuid ?? '';
  bool hasCarrierUuid() => _carrierUuid != null;

  // "plataforma" field.
  String? _plataforma;
  String get plataforma => _plataforma ?? '';
  bool hasPlataforma() => _plataforma != null;

  void _initializeFields() {
    _precio = castToType<double>(snapshotData['precio']);
    _pesoMin = castToType<double>(snapshotData['pesoMin']);
    _pesoMax = castToType<double>(snapshotData['pesoMax']);
    _lista = snapshotData['lista'] as String?;
    _carrierUuid = snapshotData['carrierUuid'] as String?;
    _plataforma = snapshotData['plataforma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('precios');

  static Stream<PreciosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PreciosRecord.fromSnapshot(s));

  static Future<PreciosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PreciosRecord.fromSnapshot(s));

  static PreciosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PreciosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PreciosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PreciosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PreciosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PreciosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPreciosRecordData({
  double? precio,
  double? pesoMin,
  double? pesoMax,
  String? lista,
  String? carrierUuid,
  String? plataforma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'precio': precio,
      'pesoMin': pesoMin,
      'pesoMax': pesoMax,
      'lista': lista,
      'carrierUuid': carrierUuid,
      'plataforma': plataforma,
    }.withoutNulls,
  );

  return firestoreData;
}

class PreciosRecordDocumentEquality implements Equality<PreciosRecord> {
  const PreciosRecordDocumentEquality();

  @override
  bool equals(PreciosRecord? e1, PreciosRecord? e2) {
    return e1?.precio == e2?.precio &&
        e1?.pesoMin == e2?.pesoMin &&
        e1?.pesoMax == e2?.pesoMax &&
        e1?.lista == e2?.lista &&
        e1?.carrierUuid == e2?.carrierUuid &&
        e1?.plataforma == e2?.plataforma;
  }

  @override
  int hash(PreciosRecord? e) => const ListEquality().hash([
        e?.precio,
        e?.pesoMin,
        e?.pesoMax,
        e?.lista,
        e?.carrierUuid,
        e?.plataforma
      ]);

  @override
  bool isValidKey(Object? o) => o is PreciosRecord;
}
