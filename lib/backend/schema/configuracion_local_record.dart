import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfiguracionLocalRecord extends FirestoreRecord {
  ConfiguracionLocalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "listas_de_precio" field.
  List<String>? _listasDePrecio;
  List<String> get listasDePrecio => _listasDePrecio ?? const [];
  bool hasListasDePrecio() => _listasDePrecio != null;

  // "nombre_plataforma" field.
  String? _nombrePlataforma;
  String get nombrePlataforma => _nombrePlataforma ?? '';
  bool hasNombrePlataforma() => _nombrePlataforma != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "lista_default" field.
  String? _listaDefault;
  String get listaDefault => _listaDefault ?? '';
  bool hasListaDefault() => _listaDefault != null;

  // "default_status_new_user" field.
  bool? _defaultStatusNewUser;
  bool get defaultStatusNewUser => _defaultStatusNewUser ?? false;
  bool hasDefaultStatusNewUser() => _defaultStatusNewUser != null;

  // "saldoPlataforma" field.
  double? _saldoPlataforma;
  double get saldoPlataforma => _saldoPlataforma ?? 0.0;
  bool hasSaldoPlataforma() => _saldoPlataforma != null;

  // "datos_bancarios" field.
  CuentaBancariaStruct? _datosBancarios;
  CuentaBancariaStruct get datosBancarios =>
      _datosBancarios ?? CuentaBancariaStruct();
  bool hasDatosBancarios() => _datosBancarios != null;

  // "transacciones" field.
  int? _transacciones;
  int get transacciones => _transacciones ?? 0;
  bool hasTransacciones() => _transacciones != null;

  // "administradoresUuid" field.
  List<String>? _administradoresUuid;
  List<String> get administradoresUuid => _administradoresUuid ?? const [];
  bool hasAdministradoresUuid() => _administradoresUuid != null;

  // "fondoInicioSesion" field.
  String? _fondoInicioSesion;
  String get fondoInicioSesion => _fondoInicioSesion ?? '';
  bool hasFondoInicioSesion() => _fondoInicioSesion != null;

  void _initializeFields() {
    _uuid = snapshotData['uuid'] as String?;
    _listasDePrecio = getDataList(snapshotData['listas_de_precio']);
    _nombrePlataforma = snapshotData['nombre_plataforma'] as String?;
    _logo = snapshotData['logo'] as String?;
    _listaDefault = snapshotData['lista_default'] as String?;
    _defaultStatusNewUser = snapshotData['default_status_new_user'] as bool?;
    _saldoPlataforma = castToType<double>(snapshotData['saldoPlataforma']);
    _datosBancarios =
        CuentaBancariaStruct.maybeFromMap(snapshotData['datos_bancarios']);
    _transacciones = castToType<int>(snapshotData['transacciones']);
    _administradoresUuid = getDataList(snapshotData['administradoresUuid']);
    _fondoInicioSesion = snapshotData['fondoInicioSesion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('configuracion_local');

  static Stream<ConfiguracionLocalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfiguracionLocalRecord.fromSnapshot(s));

  static Future<ConfiguracionLocalRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ConfiguracionLocalRecord.fromSnapshot(s));

  static ConfiguracionLocalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfiguracionLocalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfiguracionLocalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfiguracionLocalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfiguracionLocalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfiguracionLocalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfiguracionLocalRecordData({
  String? uuid,
  String? nombrePlataforma,
  String? logo,
  String? listaDefault,
  bool? defaultStatusNewUser,
  double? saldoPlataforma,
  CuentaBancariaStruct? datosBancarios,
  int? transacciones,
  String? fondoInicioSesion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uuid': uuid,
      'nombre_plataforma': nombrePlataforma,
      'logo': logo,
      'lista_default': listaDefault,
      'default_status_new_user': defaultStatusNewUser,
      'saldoPlataforma': saldoPlataforma,
      'datos_bancarios': CuentaBancariaStruct().toMap(),
      'transacciones': transacciones,
      'fondoInicioSesion': fondoInicioSesion,
    }.withoutNulls,
  );

  // Handle nested data for "datos_bancarios" field.
  addCuentaBancariaStructData(firestoreData, datosBancarios, 'datos_bancarios');

  return firestoreData;
}

class ConfiguracionLocalRecordDocumentEquality
    implements Equality<ConfiguracionLocalRecord> {
  const ConfiguracionLocalRecordDocumentEquality();

  @override
  bool equals(ConfiguracionLocalRecord? e1, ConfiguracionLocalRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uuid == e2?.uuid &&
        listEquality.equals(e1?.listasDePrecio, e2?.listasDePrecio) &&
        e1?.nombrePlataforma == e2?.nombrePlataforma &&
        e1?.logo == e2?.logo &&
        e1?.listaDefault == e2?.listaDefault &&
        e1?.defaultStatusNewUser == e2?.defaultStatusNewUser &&
        e1?.saldoPlataforma == e2?.saldoPlataforma &&
        e1?.datosBancarios == e2?.datosBancarios &&
        e1?.transacciones == e2?.transacciones &&
        listEquality.equals(e1?.administradoresUuid, e2?.administradoresUuid) &&
        e1?.fondoInicioSesion == e2?.fondoInicioSesion;
  }

  @override
  int hash(ConfiguracionLocalRecord? e) => const ListEquality().hash([
        e?.uuid,
        e?.listasDePrecio,
        e?.nombrePlataforma,
        e?.logo,
        e?.listaDefault,
        e?.defaultStatusNewUser,
        e?.saldoPlataforma,
        e?.datosBancarios,
        e?.transacciones,
        e?.administradoresUuid,
        e?.fondoInicioSesion
      ]);

  @override
  bool isValidKey(Object? o) => o is ConfiguracionLocalRecord;
}
