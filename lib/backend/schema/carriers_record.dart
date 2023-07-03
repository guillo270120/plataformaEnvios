import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarriersRecord extends FirestoreRecord {
  CarriersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombreCarrier" field.
  String? _nombreCarrier;
  String get nombreCarrier => _nombreCarrier ?? '';
  bool hasNombreCarrier() => _nombreCarrier != null;

  // "idPlataforma" field.
  int? _idPlataforma;
  int get idPlataforma => _idPlataforma ?? 0;
  bool hasIdPlataforma() => _idPlataforma != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "precios" field.
  List<PreciosStruct>? _precios;
  List<PreciosStruct> get precios => _precios ?? const [];
  bool hasPrecios() => _precios != null;

  // "eta" field.
  int? _eta;
  int get eta => _eta ?? 0;
  bool hasEta() => _eta != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "servicio" field.
  String? _servicio;
  String get servicio => _servicio ?? '';
  bool hasServicio() => _servicio != null;

  // "uuidCarrier" field.
  String? _uuidCarrier;
  String get uuidCarrier => _uuidCarrier ?? '';
  bool hasUuidCarrier() => _uuidCarrier != null;

  // "plataforma" field.
  String? _plataforma;
  String get plataforma => _plataforma ?? '';
  bool hasPlataforma() => _plataforma != null;

  void _initializeFields() {
    _nombreCarrier = snapshotData['nombreCarrier'] as String?;
    _idPlataforma = castToType<int>(snapshotData['idPlataforma']);
    _imagen = snapshotData['Imagen'] as String?;
    _precios = getStructList(
      snapshotData['precios'],
      PreciosStruct.fromMap,
    );
    _eta = castToType<int>(snapshotData['eta']);
    _status = snapshotData['status'] as bool?;
    _servicio = snapshotData['servicio'] as String?;
    _uuidCarrier = snapshotData['uuidCarrier'] as String?;
    _plataforma = snapshotData['plataforma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carriers');

  static Stream<CarriersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarriersRecord.fromSnapshot(s));

  static Future<CarriersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarriersRecord.fromSnapshot(s));

  static CarriersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarriersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarriersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarriersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarriersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarriersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarriersRecordData({
  String? nombreCarrier,
  int? idPlataforma,
  String? imagen,
  int? eta,
  bool? status,
  String? servicio,
  String? uuidCarrier,
  String? plataforma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreCarrier': nombreCarrier,
      'idPlataforma': idPlataforma,
      'Imagen': imagen,
      'eta': eta,
      'status': status,
      'servicio': servicio,
      'uuidCarrier': uuidCarrier,
      'plataforma': plataforma,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarriersRecordDocumentEquality implements Equality<CarriersRecord> {
  const CarriersRecordDocumentEquality();

  @override
  bool equals(CarriersRecord? e1, CarriersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreCarrier == e2?.nombreCarrier &&
        e1?.idPlataforma == e2?.idPlataforma &&
        e1?.imagen == e2?.imagen &&
        listEquality.equals(e1?.precios, e2?.precios) &&
        e1?.eta == e2?.eta &&
        e1?.status == e2?.status &&
        e1?.servicio == e2?.servicio &&
        e1?.uuidCarrier == e2?.uuidCarrier &&
        e1?.plataforma == e2?.plataforma;
  }

  @override
  int hash(CarriersRecord? e) => const ListEquality().hash([
        e?.nombreCarrier,
        e?.idPlataforma,
        e?.imagen,
        e?.precios,
        e?.eta,
        e?.status,
        e?.servicio,
        e?.uuidCarrier,
        e?.plataforma
      ]);

  @override
  bool isValidKey(Object? o) => o is CarriersRecord;
}
