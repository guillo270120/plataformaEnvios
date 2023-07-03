// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreciosStruct extends FFFirebaseStruct {
  PreciosStruct({
    String? idCarrier,
    String? lista,
    double? pesoMin,
    double? pesoMax,
    double? precio,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idCarrier = idCarrier,
        _lista = lista,
        _pesoMin = pesoMin,
        _pesoMax = pesoMax,
        _precio = precio,
        super(firestoreUtilData);

  // "idCarrier" field.
  String? _idCarrier;
  String get idCarrier => _idCarrier ?? '';
  set idCarrier(String? val) => _idCarrier = val;
  bool hasIdCarrier() => _idCarrier != null;

  // "lista" field.
  String? _lista;
  String get lista => _lista ?? '';
  set lista(String? val) => _lista = val;
  bool hasLista() => _lista != null;

  // "pesoMin" field.
  double? _pesoMin;
  double get pesoMin => _pesoMin ?? 0.0;
  set pesoMin(double? val) => _pesoMin = val;
  void incrementPesoMin(double amount) => _pesoMin = pesoMin + amount;
  bool hasPesoMin() => _pesoMin != null;

  // "pesoMax" field.
  double? _pesoMax;
  double get pesoMax => _pesoMax ?? 0.0;
  set pesoMax(double? val) => _pesoMax = val;
  void incrementPesoMax(double amount) => _pesoMax = pesoMax + amount;
  bool hasPesoMax() => _pesoMax != null;

  // "Precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  set precio(double? val) => _precio = val;
  void incrementPrecio(double amount) => _precio = precio + amount;
  bool hasPrecio() => _precio != null;

  static PreciosStruct fromMap(Map<String, dynamic> data) => PreciosStruct(
        idCarrier: data['idCarrier'] as String?,
        lista: data['lista'] as String?,
        pesoMin: castToType<double>(data['pesoMin']),
        pesoMax: castToType<double>(data['pesoMax']),
        precio: castToType<double>(data['Precio']),
      );

  static PreciosStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PreciosStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'idCarrier': _idCarrier,
        'lista': _lista,
        'pesoMin': _pesoMin,
        'pesoMax': _pesoMax,
        'Precio': _precio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idCarrier': serializeParam(
          _idCarrier,
          ParamType.String,
        ),
        'lista': serializeParam(
          _lista,
          ParamType.String,
        ),
        'pesoMin': serializeParam(
          _pesoMin,
          ParamType.double,
        ),
        'pesoMax': serializeParam(
          _pesoMax,
          ParamType.double,
        ),
        'Precio': serializeParam(
          _precio,
          ParamType.double,
        ),
      }.withoutNulls;

  static PreciosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PreciosStruct(
        idCarrier: deserializeParam(
          data['idCarrier'],
          ParamType.String,
          false,
        ),
        lista: deserializeParam(
          data['lista'],
          ParamType.String,
          false,
        ),
        pesoMin: deserializeParam(
          data['pesoMin'],
          ParamType.double,
          false,
        ),
        pesoMax: deserializeParam(
          data['pesoMax'],
          ParamType.double,
          false,
        ),
        precio: deserializeParam(
          data['Precio'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PreciosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PreciosStruct &&
        idCarrier == other.idCarrier &&
        lista == other.lista &&
        pesoMin == other.pesoMin &&
        pesoMax == other.pesoMax &&
        precio == other.precio;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([idCarrier, lista, pesoMin, pesoMax, precio]);
}

PreciosStruct createPreciosStruct({
  String? idCarrier,
  String? lista,
  double? pesoMin,
  double? pesoMax,
  double? precio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PreciosStruct(
      idCarrier: idCarrier,
      lista: lista,
      pesoMin: pesoMin,
      pesoMax: pesoMax,
      precio: precio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PreciosStruct? updatePreciosStruct(
  PreciosStruct? precios, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    precios
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPreciosStructData(
  Map<String, dynamic> firestoreData,
  PreciosStruct? precios,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (precios == null) {
    return;
  }
  if (precios.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && precios.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final preciosData = getPreciosFirestoreData(precios, forFieldValue);
  final nestedData = preciosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = precios.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPreciosFirestoreData(
  PreciosStruct? precios, [
  bool forFieldValue = false,
]) {
  if (precios == null) {
    return {};
  }
  final firestoreData = mapToFirestore(precios.toMap());

  // Add any Firestore field values
  precios.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPreciosListFirestoreData(
  List<PreciosStruct>? precioss,
) =>
    precioss?.map((e) => getPreciosFirestoreData(e, true)).toList() ?? [];
