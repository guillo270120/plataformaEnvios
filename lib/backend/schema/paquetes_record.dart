import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaquetesRecord extends FirestoreRecord {
  PaquetesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  bool hasAlias() => _alias != null;

  // "largo" field.
  double? _largo;
  double get largo => _largo ?? 0.0;
  bool hasLargo() => _largo != null;

  // "ancho" field.
  double? _ancho;
  double get ancho => _ancho ?? 0.0;
  bool hasAncho() => _ancho != null;

  // "alto" field.
  double? _alto;
  double get alto => _alto ?? 0.0;
  bool hasAlto() => _alto != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "contenido" field.
  String? _contenido;
  String get contenido => _contenido ?? '';
  bool hasContenido() => _contenido != null;

  // "filtros" field.
  List<String>? _filtros;
  List<String> get filtros => _filtros ?? const [];
  bool hasFiltros() => _filtros != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "plataforma" field.
  String? _plataforma;
  String get plataforma => _plataforma ?? '';
  bool hasPlataforma() => _plataforma != null;

  void _initializeFields() {
    _alias = snapshotData['alias'] as String?;
    _largo = castToType<double>(snapshotData['largo']);
    _ancho = castToType<double>(snapshotData['ancho']);
    _alto = castToType<double>(snapshotData['alto']);
    _peso = castToType<double>(snapshotData['peso']);
    _contenido = snapshotData['contenido'] as String?;
    _filtros = getDataList(snapshotData['filtros']);
    _userId = snapshotData['userId'] as String?;
    _plataforma = snapshotData['plataforma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paquetes');

  static Stream<PaquetesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaquetesRecord.fromSnapshot(s));

  static Future<PaquetesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaquetesRecord.fromSnapshot(s));

  static PaquetesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaquetesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaquetesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaquetesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaquetesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaquetesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaquetesRecordData({
  String? alias,
  double? largo,
  double? ancho,
  double? alto,
  double? peso,
  String? contenido,
  String? userId,
  String? plataforma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'alias': alias,
      'largo': largo,
      'ancho': ancho,
      'alto': alto,
      'peso': peso,
      'contenido': contenido,
      'userId': userId,
      'plataforma': plataforma,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaquetesRecordDocumentEquality implements Equality<PaquetesRecord> {
  const PaquetesRecordDocumentEquality();

  @override
  bool equals(PaquetesRecord? e1, PaquetesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.alias == e2?.alias &&
        e1?.largo == e2?.largo &&
        e1?.ancho == e2?.ancho &&
        e1?.alto == e2?.alto &&
        e1?.peso == e2?.peso &&
        e1?.contenido == e2?.contenido &&
        listEquality.equals(e1?.filtros, e2?.filtros) &&
        e1?.userId == e2?.userId &&
        e1?.plataforma == e2?.plataforma;
  }

  @override
  int hash(PaquetesRecord? e) => const ListEquality().hash([
        e?.alias,
        e?.largo,
        e?.ancho,
        e?.alto,
        e?.peso,
        e?.contenido,
        e?.filtros,
        e?.userId,
        e?.plataforma
      ]);

  @override
  bool isValidKey(Object? o) => o is PaquetesRecord;
}
