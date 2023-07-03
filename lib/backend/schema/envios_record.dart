import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnviosRecord extends FirestoreRecord {
  EnviosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "origen" field.
  OriginAttributesStruct? _origen;
  OriginAttributesStruct get origen => _origen ?? OriginAttributesStruct();
  bool hasOrigen() => _origen != null;

  // "destino" field.
  DestinationAttributesStruct? _destino;
  DestinationAttributesStruct get destino =>
      _destino ?? DestinationAttributesStruct();
  bool hasDestino() => _destino != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "step" field.
  String? _step;
  String get step => _step ?? '';
  bool hasStep() => _step != null;

  // "filtros" field.
  List<String>? _filtros;
  List<String> get filtros => _filtros ?? const [];
  bool hasFiltros() => _filtros != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "paquete" field.
  ParcelStruct? _paquete;
  ParcelStruct get paquete => _paquete ?? ParcelStruct();
  bool hasPaquete() => _paquete != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "label_url" field.
  String? _labelUrl;
  String get labelUrl => _labelUrl ?? '';
  bool hasLabelUrl() => _labelUrl != null;

  // "shipId" field.
  int? _shipId;
  int get shipId => _shipId ?? 0;
  bool hasShipId() => _shipId != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "rastreo" field.
  String? _rastreo;
  String get rastreo => _rastreo ?? '';
  bool hasRastreo() => _rastreo != null;

  // "plataforma" field.
  String? _plataforma;
  String get plataforma => _plataforma ?? '';
  bool hasPlataforma() => _plataforma != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _origen = OriginAttributesStruct.maybeFromMap(snapshotData['origen']);
    _destino =
        DestinationAttributesStruct.maybeFromMap(snapshotData['destino']);
    _status = snapshotData['status'] as String?;
    _step = snapshotData['step'] as String?;
    _filtros = getDataList(snapshotData['filtros']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _paquete = ParcelStruct.maybeFromMap(snapshotData['paquete']);
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _labelUrl = snapshotData['label_url'] as String?;
    _shipId = castToType<int>(snapshotData['shipId']);
    _link = snapshotData['link'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _rastreo = snapshotData['rastreo'] as String?;
    _plataforma = snapshotData['plataforma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('envios');

  static Stream<EnviosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnviosRecord.fromSnapshot(s));

  static Future<EnviosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnviosRecord.fromSnapshot(s));

  static EnviosRecord fromSnapshot(DocumentSnapshot snapshot) => EnviosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnviosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnviosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnviosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnviosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnviosRecordData({
  String? userId,
  OriginAttributesStruct? origen,
  DestinationAttributesStruct? destino,
  String? status,
  String? step,
  DateTime? createdAt,
  ParcelStruct? paquete,
  int? cantidad,
  String? labelUrl,
  int? shipId,
  String? link,
  double? precio,
  String? rastreo,
  String? plataforma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'origen': OriginAttributesStruct().toMap(),
      'destino': DestinationAttributesStruct().toMap(),
      'status': status,
      'step': step,
      'createdAt': createdAt,
      'paquete': ParcelStruct().toMap(),
      'cantidad': cantidad,
      'label_url': labelUrl,
      'shipId': shipId,
      'link': link,
      'precio': precio,
      'rastreo': rastreo,
      'plataforma': plataforma,
    }.withoutNulls,
  );

  // Handle nested data for "origen" field.
  addOriginAttributesStructData(firestoreData, origen, 'origen');

  // Handle nested data for "destino" field.
  addDestinationAttributesStructData(firestoreData, destino, 'destino');

  // Handle nested data for "paquete" field.
  addParcelStructData(firestoreData, paquete, 'paquete');

  return firestoreData;
}

class EnviosRecordDocumentEquality implements Equality<EnviosRecord> {
  const EnviosRecordDocumentEquality();

  @override
  bool equals(EnviosRecord? e1, EnviosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        e1?.origen == e2?.origen &&
        e1?.destino == e2?.destino &&
        e1?.status == e2?.status &&
        e1?.step == e2?.step &&
        listEquality.equals(e1?.filtros, e2?.filtros) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.paquete == e2?.paquete &&
        e1?.cantidad == e2?.cantidad &&
        e1?.labelUrl == e2?.labelUrl &&
        e1?.shipId == e2?.shipId &&
        e1?.link == e2?.link &&
        e1?.precio == e2?.precio &&
        e1?.rastreo == e2?.rastreo &&
        e1?.plataforma == e2?.plataforma;
  }

  @override
  int hash(EnviosRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.origen,
        e?.destino,
        e?.status,
        e?.step,
        e?.filtros,
        e?.createdAt,
        e?.paquete,
        e?.cantidad,
        e?.labelUrl,
        e?.shipId,
        e?.link,
        e?.precio,
        e?.rastreo,
        e?.plataforma
      ]);

  @override
  bool isValidKey(Object? o) => o is EnviosRecord;
}
