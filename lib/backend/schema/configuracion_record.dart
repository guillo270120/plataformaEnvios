import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfiguracionRecord extends FirestoreRecord {
  ConfiguracionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "adminId" field.
  List<String>? _adminId;
  List<String> get adminId => _adminId ?? const [];
  bool hasAdminId() => _adminId != null;

  // "user_plataforma" field.
  String? _userPlataforma;
  String get userPlataforma => _userPlataforma ?? '';
  bool hasUserPlataforma() => _userPlataforma != null;

  // "password_plataforma" field.
  String? _passwordPlataforma;
  String get passwordPlataforma => _passwordPlataforma ?? '';
  bool hasPasswordPlataforma() => _passwordPlataforma != null;

  void _initializeFields() {
    _uuid = snapshotData['uuid'] as String?;
    _adminId = getDataList(snapshotData['adminId']);
    _userPlataforma = snapshotData['user_plataforma'] as String?;
    _passwordPlataforma = snapshotData['password_plataforma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('configuracion');

  static Stream<ConfiguracionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfiguracionRecord.fromSnapshot(s));

  static Future<ConfiguracionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfiguracionRecord.fromSnapshot(s));

  static ConfiguracionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfiguracionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfiguracionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfiguracionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfiguracionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfiguracionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfiguracionRecordData({
  String? uuid,
  String? userPlataforma,
  String? passwordPlataforma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uuid': uuid,
      'user_plataforma': userPlataforma,
      'password_plataforma': passwordPlataforma,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfiguracionRecordDocumentEquality
    implements Equality<ConfiguracionRecord> {
  const ConfiguracionRecordDocumentEquality();

  @override
  bool equals(ConfiguracionRecord? e1, ConfiguracionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uuid == e2?.uuid &&
        listEquality.equals(e1?.adminId, e2?.adminId) &&
        e1?.userPlataforma == e2?.userPlataforma &&
        e1?.passwordPlataforma == e2?.passwordPlataforma;
  }

  @override
  int hash(ConfiguracionRecord? e) => const ListEquality()
      .hash([e?.uuid, e?.adminId, e?.userPlataforma, e?.passwordPlataforma]);

  @override
  bool isValidKey(Object? o) => o is ConfiguracionRecord;
}
