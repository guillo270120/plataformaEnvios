// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CuentaBancariaStruct extends FFFirebaseStruct {
  CuentaBancariaStruct({
    String? banco,
    String? cuenta,
    String? clabe,
    String? referencia,
    String? beneficiario,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _banco = banco,
        _cuenta = cuenta,
        _clabe = clabe,
        _referencia = referencia,
        _beneficiario = beneficiario,
        super(firestoreUtilData);

  // "banco" field.
  String? _banco;
  String get banco => _banco ?? '';
  set banco(String? val) => _banco = val;
  bool hasBanco() => _banco != null;

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  set cuenta(String? val) => _cuenta = val;
  bool hasCuenta() => _cuenta != null;

  // "clabe" field.
  String? _clabe;
  String get clabe => _clabe ?? '';
  set clabe(String? val) => _clabe = val;
  bool hasClabe() => _clabe != null;

  // "referencia" field.
  String? _referencia;
  String get referencia => _referencia ?? '';
  set referencia(String? val) => _referencia = val;
  bool hasReferencia() => _referencia != null;

  // "beneficiario" field.
  String? _beneficiario;
  String get beneficiario => _beneficiario ?? '';
  set beneficiario(String? val) => _beneficiario = val;
  bool hasBeneficiario() => _beneficiario != null;

  static CuentaBancariaStruct fromMap(Map<String, dynamic> data) =>
      CuentaBancariaStruct(
        banco: data['banco'] as String?,
        cuenta: data['cuenta'] as String?,
        clabe: data['clabe'] as String?,
        referencia: data['referencia'] as String?,
        beneficiario: data['beneficiario'] as String?,
      );

  static CuentaBancariaStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CuentaBancariaStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'banco': _banco,
        'cuenta': _cuenta,
        'clabe': _clabe,
        'referencia': _referencia,
        'beneficiario': _beneficiario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'banco': serializeParam(
          _banco,
          ParamType.String,
        ),
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
        ),
        'clabe': serializeParam(
          _clabe,
          ParamType.String,
        ),
        'referencia': serializeParam(
          _referencia,
          ParamType.String,
        ),
        'beneficiario': serializeParam(
          _beneficiario,
          ParamType.String,
        ),
      }.withoutNulls;

  static CuentaBancariaStruct fromSerializableMap(Map<String, dynamic> data) =>
      CuentaBancariaStruct(
        banco: deserializeParam(
          data['banco'],
          ParamType.String,
          false,
        ),
        cuenta: deserializeParam(
          data['cuenta'],
          ParamType.String,
          false,
        ),
        clabe: deserializeParam(
          data['clabe'],
          ParamType.String,
          false,
        ),
        referencia: deserializeParam(
          data['referencia'],
          ParamType.String,
          false,
        ),
        beneficiario: deserializeParam(
          data['beneficiario'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CuentaBancariaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CuentaBancariaStruct &&
        banco == other.banco &&
        cuenta == other.cuenta &&
        clabe == other.clabe &&
        referencia == other.referencia &&
        beneficiario == other.beneficiario;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([banco, cuenta, clabe, referencia, beneficiario]);
}

CuentaBancariaStruct createCuentaBancariaStruct({
  String? banco,
  String? cuenta,
  String? clabe,
  String? referencia,
  String? beneficiario,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CuentaBancariaStruct(
      banco: banco,
      cuenta: cuenta,
      clabe: clabe,
      referencia: referencia,
      beneficiario: beneficiario,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CuentaBancariaStruct? updateCuentaBancariaStruct(
  CuentaBancariaStruct? cuentaBancaria, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cuentaBancaria
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCuentaBancariaStructData(
  Map<String, dynamic> firestoreData,
  CuentaBancariaStruct? cuentaBancaria,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cuentaBancaria == null) {
    return;
  }
  if (cuentaBancaria.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && cuentaBancaria.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cuentaBancariaData =
      getCuentaBancariaFirestoreData(cuentaBancaria, forFieldValue);
  final nestedData =
      cuentaBancariaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = cuentaBancaria.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCuentaBancariaFirestoreData(
  CuentaBancariaStruct? cuentaBancaria, [
  bool forFieldValue = false,
]) {
  if (cuentaBancaria == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cuentaBancaria.toMap());

  // Add any Firestore field values
  cuentaBancaria.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCuentaBancariaListFirestoreData(
  List<CuentaBancariaStruct>? cuentaBancarias,
) =>
    cuentaBancarias
        ?.map((e) => getCuentaBancariaFirestoreData(e, true))
        .toList() ??
    [];
