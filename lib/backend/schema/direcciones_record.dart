import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DireccionesRecord extends FirestoreRecord {
  DireccionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  bool hasAlias() => _alias != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "empresa" field.
  String? _empresa;
  String get empresa => _empresa ?? '';
  bool hasEmpresa() => _empresa != null;

  // "correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  bool hasCorreo() => _correo != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "calleynumero" field.
  String? _calleynumero;
  String get calleynumero => _calleynumero ?? '';
  bool hasCalleynumero() => _calleynumero != null;

  // "colonia" field.
  String? _colonia;
  String get colonia => _colonia ?? '';
  bool hasColonia() => _colonia != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "codigopostal" field.
  String? _codigopostal;
  String get codigopostal => _codigopostal ?? '';
  bool hasCodigopostal() => _codigopostal != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "referencia" field.
  String? _referencia;
  String get referencia => _referencia ?? '';
  bool hasReferencia() => _referencia != null;

  // "filtros" field.
  List<String>? _filtros;
  List<String> get filtros => _filtros ?? const [];
  bool hasFiltros() => _filtros != null;

  // "plataforma" field.
  String? _plataforma;
  String get plataforma => _plataforma ?? '';
  bool hasPlataforma() => _plataforma != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _alias = snapshotData['alias'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _empresa = snapshotData['empresa'] as String?;
    _correo = snapshotData['correo'] as String?;
    _telefono = snapshotData['telefono'] as String?;
    _calleynumero = snapshotData['calleynumero'] as String?;
    _colonia = snapshotData['colonia'] as String?;
    _ciudad = snapshotData['ciudad'] as String?;
    _codigopostal = snapshotData['codigopostal'] as String?;
    _pais = snapshotData['pais'] as String?;
    _estado = snapshotData['estado'] as String?;
    _referencia = snapshotData['referencia'] as String?;
    _filtros = getDataList(snapshotData['filtros']);
    _plataforma = snapshotData['plataforma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('direcciones');

  static Stream<DireccionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DireccionesRecord.fromSnapshot(s));

  static Future<DireccionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DireccionesRecord.fromSnapshot(s));

  static DireccionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DireccionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DireccionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DireccionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DireccionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DireccionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDireccionesRecordData({
  String? userId,
  String? alias,
  String? nombre,
  String? empresa,
  String? correo,
  String? telefono,
  String? calleynumero,
  String? colonia,
  String? ciudad,
  String? codigopostal,
  String? pais,
  String? estado,
  String? referencia,
  String? plataforma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'alias': alias,
      'nombre': nombre,
      'empresa': empresa,
      'correo': correo,
      'telefono': telefono,
      'calleynumero': calleynumero,
      'colonia': colonia,
      'ciudad': ciudad,
      'codigopostal': codigopostal,
      'pais': pais,
      'estado': estado,
      'referencia': referencia,
      'plataforma': plataforma,
    }.withoutNulls,
  );

  return firestoreData;
}

class DireccionesRecordDocumentEquality implements Equality<DireccionesRecord> {
  const DireccionesRecordDocumentEquality();

  @override
  bool equals(DireccionesRecord? e1, DireccionesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.alias == e2?.alias &&
        e1?.nombre == e2?.nombre &&
        e1?.empresa == e2?.empresa &&
        e1?.correo == e2?.correo &&
        e1?.telefono == e2?.telefono &&
        e1?.calleynumero == e2?.calleynumero &&
        e1?.colonia == e2?.colonia &&
        e1?.ciudad == e2?.ciudad &&
        e1?.codigopostal == e2?.codigopostal &&
        e1?.pais == e2?.pais &&
        e1?.estado == e2?.estado &&
        e1?.referencia == e2?.referencia &&
        listEquality.equals(e1?.filtros, e2?.filtros) &&
        e1?.plataforma == e2?.plataforma;
  }

  @override
  int hash(DireccionesRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.alias,
        e?.nombre,
        e?.empresa,
        e?.correo,
        e?.telefono,
        e?.calleynumero,
        e?.colonia,
        e?.ciudad,
        e?.codigopostal,
        e?.pais,
        e?.estado,
        e?.referencia,
        e?.filtros,
        e?.plataforma
      ]);

  @override
  bool isValidKey(Object? o) => o is DireccionesRecord;
}
