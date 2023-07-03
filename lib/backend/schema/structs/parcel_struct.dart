// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParcelStruct extends FFFirebaseStruct {
  ParcelStruct({
    String? parcelType,
    String? distanceUnit,
    String? massUnit,
    double? weight,
    double? length,
    double? height,
    double? width,
    bool? editable,
    String? contents,
    int? shipmentId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _parcelType = parcelType,
        _distanceUnit = distanceUnit,
        _massUnit = massUnit,
        _weight = weight,
        _length = length,
        _height = height,
        _width = width,
        _editable = editable,
        _contents = contents,
        _shipmentId = shipmentId,
        super(firestoreUtilData);

  // "parcel_type" field.
  String? _parcelType;
  String get parcelType => _parcelType ?? '';
  set parcelType(String? val) => _parcelType = val;
  bool hasParcelType() => _parcelType != null;

  // "distance_unit" field.
  String? _distanceUnit;
  String get distanceUnit => _distanceUnit ?? '';
  set distanceUnit(String? val) => _distanceUnit = val;
  bool hasDistanceUnit() => _distanceUnit != null;

  // "mass_unit" field.
  String? _massUnit;
  String get massUnit => _massUnit ?? '';
  set massUnit(String? val) => _massUnit = val;
  bool hasMassUnit() => _massUnit != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;
  void incrementWeight(double amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "length" field.
  double? _length;
  double get length => _length ?? 0.0;
  set length(double? val) => _length = val;
  void incrementLength(double amount) => _length = length + amount;
  bool hasLength() => _length != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;
  void incrementHeight(double amount) => _height = height + amount;
  bool hasHeight() => _height != null;

  // "width" field.
  double? _width;
  double get width => _width ?? 0.0;
  set width(double? val) => _width = val;
  void incrementWidth(double amount) => _width = width + amount;
  bool hasWidth() => _width != null;

  // "editable" field.
  bool? _editable;
  bool get editable => _editable ?? false;
  set editable(bool? val) => _editable = val;
  bool hasEditable() => _editable != null;

  // "contents" field.
  String? _contents;
  String get contents => _contents ?? '';
  set contents(String? val) => _contents = val;
  bool hasContents() => _contents != null;

  // "shipment_id" field.
  int? _shipmentId;
  int get shipmentId => _shipmentId ?? 0;
  set shipmentId(int? val) => _shipmentId = val;
  void incrementShipmentId(int amount) => _shipmentId = shipmentId + amount;
  bool hasShipmentId() => _shipmentId != null;

  static ParcelStruct fromMap(Map<String, dynamic> data) => ParcelStruct(
        parcelType: data['parcel_type'] as String?,
        distanceUnit: data['distance_unit'] as String?,
        massUnit: data['mass_unit'] as String?,
        weight: castToType<double>(data['weight']),
        length: castToType<double>(data['length']),
        height: castToType<double>(data['height']),
        width: castToType<double>(data['width']),
        editable: data['editable'] as bool?,
        contents: data['contents'] as String?,
        shipmentId: castToType<int>(data['shipment_id']),
      );

  static ParcelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ParcelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'parcel_type': _parcelType,
        'distance_unit': _distanceUnit,
        'mass_unit': _massUnit,
        'weight': _weight,
        'length': _length,
        'height': _height,
        'width': _width,
        'editable': _editable,
        'contents': _contents,
        'shipment_id': _shipmentId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'parcel_type': serializeParam(
          _parcelType,
          ParamType.String,
        ),
        'distance_unit': serializeParam(
          _distanceUnit,
          ParamType.String,
        ),
        'mass_unit': serializeParam(
          _massUnit,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'length': serializeParam(
          _length,
          ParamType.double,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'width': serializeParam(
          _width,
          ParamType.double,
        ),
        'editable': serializeParam(
          _editable,
          ParamType.bool,
        ),
        'contents': serializeParam(
          _contents,
          ParamType.String,
        ),
        'shipment_id': serializeParam(
          _shipmentId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ParcelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParcelStruct(
        parcelType: deserializeParam(
          data['parcel_type'],
          ParamType.String,
          false,
        ),
        distanceUnit: deserializeParam(
          data['distance_unit'],
          ParamType.String,
          false,
        ),
        massUnit: deserializeParam(
          data['mass_unit'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        length: deserializeParam(
          data['length'],
          ParamType.double,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.double,
          false,
        ),
        editable: deserializeParam(
          data['editable'],
          ParamType.bool,
          false,
        ),
        contents: deserializeParam(
          data['contents'],
          ParamType.String,
          false,
        ),
        shipmentId: deserializeParam(
          data['shipment_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ParcelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParcelStruct &&
        parcelType == other.parcelType &&
        distanceUnit == other.distanceUnit &&
        massUnit == other.massUnit &&
        weight == other.weight &&
        length == other.length &&
        height == other.height &&
        width == other.width &&
        editable == other.editable &&
        contents == other.contents &&
        shipmentId == other.shipmentId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        parcelType,
        distanceUnit,
        massUnit,
        weight,
        length,
        height,
        width,
        editable,
        contents,
        shipmentId
      ]);
}

ParcelStruct createParcelStruct({
  String? parcelType,
  String? distanceUnit,
  String? massUnit,
  double? weight,
  double? length,
  double? height,
  double? width,
  bool? editable,
  String? contents,
  int? shipmentId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParcelStruct(
      parcelType: parcelType,
      distanceUnit: distanceUnit,
      massUnit: massUnit,
      weight: weight,
      length: length,
      height: height,
      width: width,
      editable: editable,
      contents: contents,
      shipmentId: shipmentId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParcelStruct? updateParcelStruct(
  ParcelStruct? parcel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    parcel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParcelStructData(
  Map<String, dynamic> firestoreData,
  ParcelStruct? parcel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (parcel == null) {
    return;
  }
  if (parcel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && parcel.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final parcelData = getParcelFirestoreData(parcel, forFieldValue);
  final nestedData = parcelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = parcel.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParcelFirestoreData(
  ParcelStruct? parcel, [
  bool forFieldValue = false,
]) {
  if (parcel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(parcel.toMap());

  // Add any Firestore field values
  parcel.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParcelListFirestoreData(
  List<ParcelStruct>? parcels,
) =>
    parcels?.map((e) => getParcelFirestoreData(e, true)).toList() ?? [];
