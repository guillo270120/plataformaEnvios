import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransaccionesRecord extends FirestoreRecord {
  TransaccionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "cantidad" field.
  double? _cantidad;
  double get cantidad => _cantidad ?? 0.0;
  bool hasCantidad() => _cantidad != null;

  // "fuente" field.
  String? _fuente;
  String get fuente => _fuente ?? '';
  bool hasFuente() => _fuente != null;

  // "id_transaccion" field.
  String? _idTransaccion;
  String get idTransaccion => _idTransaccion ?? '';
  bool hasIdTransaccion() => _idTransaccion != null;

  // "plataforma" field.
  String? _plataforma;
  String get plataforma => _plataforma ?? '';
  bool hasPlataforma() => _plataforma != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "filtros" field.
  List<String>? _filtros;
  List<String> get filtros => _filtros ?? const [];
  bool hasFiltros() => _filtros != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "imagenPago" field.
  String? _imagenPago;
  String get imagenPago => _imagenPago ?? '';
  bool hasImagenPago() => _imagenPago != null;

  void _initializeFields() {
    _tipo = snapshotData['tipo'] as String?;
    _cantidad = castToType<double>(snapshotData['cantidad']);
    _fuente = snapshotData['fuente'] as String?;
    _idTransaccion = snapshotData['id_transaccion'] as String?;
    _plataforma = snapshotData['plataforma'] as String?;
    _status = snapshotData['status'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _filtros = getDataList(snapshotData['filtros']);
    _userId = snapshotData['userId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _imagenPago = snapshotData['imagenPago'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transacciones');

  static Stream<TransaccionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransaccionesRecord.fromSnapshot(s));

  static Future<TransaccionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransaccionesRecord.fromSnapshot(s));

  static TransaccionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransaccionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransaccionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransaccionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransaccionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransaccionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransaccionesRecordData({
  String? tipo,
  double? cantidad,
  String? fuente,
  String? idTransaccion,
  String? plataforma,
  String? status,
  DocumentReference? user,
  String? userId,
  DateTime? createdAt,
  DocumentReference? userRef,
  String? imagenPago,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
      'cantidad': cantidad,
      'fuente': fuente,
      'id_transaccion': idTransaccion,
      'plataforma': plataforma,
      'status': status,
      'user': user,
      'userId': userId,
      'createdAt': createdAt,
      'UserRef': userRef,
      'imagenPago': imagenPago,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransaccionesRecordDocumentEquality
    implements Equality<TransaccionesRecord> {
  const TransaccionesRecordDocumentEquality();

  @override
  bool equals(TransaccionesRecord? e1, TransaccionesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tipo == e2?.tipo &&
        e1?.cantidad == e2?.cantidad &&
        e1?.fuente == e2?.fuente &&
        e1?.idTransaccion == e2?.idTransaccion &&
        e1?.plataforma == e2?.plataforma &&
        e1?.status == e2?.status &&
        e1?.user == e2?.user &&
        listEquality.equals(e1?.filtros, e2?.filtros) &&
        e1?.userId == e2?.userId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.imagenPago == e2?.imagenPago;
  }

  @override
  int hash(TransaccionesRecord? e) => const ListEquality().hash([
        e?.tipo,
        e?.cantidad,
        e?.fuente,
        e?.idTransaccion,
        e?.plataforma,
        e?.status,
        e?.user,
        e?.filtros,
        e?.userId,
        e?.createdAt,
        e?.userRef,
        e?.imagenPago
      ]);

  @override
  bool isValidKey(Object? o) => o is TransaccionesRecord;
}
