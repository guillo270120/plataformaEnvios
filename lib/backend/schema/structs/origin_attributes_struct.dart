// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OriginAttributesStruct extends FFFirebaseStruct {
  OriginAttributesStruct({
    String? name,
    String? company,
    String? street,
    String? neighborhood,
    String? city,
    String? state,
    String? postalCode,
    String? email,
    String? phone,
    int? countryId,
    String? reference1,
    String? callingCode,
    bool? save,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _company = company,
        _street = street,
        _neighborhood = neighborhood,
        _city = city,
        _state = state,
        _postalCode = postalCode,
        _email = email,
        _phone = phone,
        _countryId = countryId,
        _reference1 = reference1,
        _callingCode = callingCode,
        _save = save,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  set company(String? val) => _company = val;
  bool hasCompany() => _company != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;
  bool hasStreet() => _street != null;

  // "neighborhood" field.
  String? _neighborhood;
  String get neighborhood => _neighborhood ?? '';
  set neighborhood(String? val) => _neighborhood = val;
  bool hasNeighborhood() => _neighborhood != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "postal_code" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;
  bool hasPostalCode() => _postalCode != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "country_id" field.
  int? _countryId;
  int get countryId => _countryId ?? 0;
  set countryId(int? val) => _countryId = val;
  void incrementCountryId(int amount) => _countryId = countryId + amount;
  bool hasCountryId() => _countryId != null;

  // "reference1" field.
  String? _reference1;
  String get reference1 => _reference1 ?? '';
  set reference1(String? val) => _reference1 = val;
  bool hasReference1() => _reference1 != null;

  // "calling_code" field.
  String? _callingCode;
  String get callingCode => _callingCode ?? '';
  set callingCode(String? val) => _callingCode = val;
  bool hasCallingCode() => _callingCode != null;

  // "save" field.
  bool? _save;
  bool get save => _save ?? false;
  set save(bool? val) => _save = val;
  bool hasSave() => _save != null;

  static OriginAttributesStruct fromMap(Map<String, dynamic> data) =>
      OriginAttributesStruct(
        name: data['name'] as String?,
        company: data['company'] as String?,
        street: data['street'] as String?,
        neighborhood: data['neighborhood'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        postalCode: data['postal_code'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        countryId: castToType<int>(data['country_id']),
        reference1: data['reference1'] as String?,
        callingCode: data['calling_code'] as String?,
        save: data['save'] as bool?,
      );

  static OriginAttributesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? OriginAttributesStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'company': _company,
        'street': _street,
        'neighborhood': _neighborhood,
        'city': _city,
        'state': _state,
        'postal_code': _postalCode,
        'email': _email,
        'phone': _phone,
        'country_id': _countryId,
        'reference1': _reference1,
        'calling_code': _callingCode,
        'save': _save,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'company': serializeParam(
          _company,
          ParamType.String,
        ),
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'neighborhood': serializeParam(
          _neighborhood,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'postal_code': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'country_id': serializeParam(
          _countryId,
          ParamType.int,
        ),
        'reference1': serializeParam(
          _reference1,
          ParamType.String,
        ),
        'calling_code': serializeParam(
          _callingCode,
          ParamType.String,
        ),
        'save': serializeParam(
          _save,
          ParamType.bool,
        ),
      }.withoutNulls;

  static OriginAttributesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OriginAttributesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        company: deserializeParam(
          data['company'],
          ParamType.String,
          false,
        ),
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        neighborhood: deserializeParam(
          data['neighborhood'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postal_code'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        countryId: deserializeParam(
          data['country_id'],
          ParamType.int,
          false,
        ),
        reference1: deserializeParam(
          data['reference1'],
          ParamType.String,
          false,
        ),
        callingCode: deserializeParam(
          data['calling_code'],
          ParamType.String,
          false,
        ),
        save: deserializeParam(
          data['save'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'OriginAttributesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OriginAttributesStruct &&
        name == other.name &&
        company == other.company &&
        street == other.street &&
        neighborhood == other.neighborhood &&
        city == other.city &&
        state == other.state &&
        postalCode == other.postalCode &&
        email == other.email &&
        phone == other.phone &&
        countryId == other.countryId &&
        reference1 == other.reference1 &&
        callingCode == other.callingCode &&
        save == other.save;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        company,
        street,
        neighborhood,
        city,
        state,
        postalCode,
        email,
        phone,
        countryId,
        reference1,
        callingCode,
        save
      ]);
}

OriginAttributesStruct createOriginAttributesStruct({
  String? name,
  String? company,
  String? street,
  String? neighborhood,
  String? city,
  String? state,
  String? postalCode,
  String? email,
  String? phone,
  int? countryId,
  String? reference1,
  String? callingCode,
  bool? save,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OriginAttributesStruct(
      name: name,
      company: company,
      street: street,
      neighborhood: neighborhood,
      city: city,
      state: state,
      postalCode: postalCode,
      email: email,
      phone: phone,
      countryId: countryId,
      reference1: reference1,
      callingCode: callingCode,
      save: save,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OriginAttributesStruct? updateOriginAttributesStruct(
  OriginAttributesStruct? originAttributes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    originAttributes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOriginAttributesStructData(
  Map<String, dynamic> firestoreData,
  OriginAttributesStruct? originAttributes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (originAttributes == null) {
    return;
  }
  if (originAttributes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && originAttributes.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final originAttributesData =
      getOriginAttributesFirestoreData(originAttributes, forFieldValue);
  final nestedData =
      originAttributesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = originAttributes.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOriginAttributesFirestoreData(
  OriginAttributesStruct? originAttributes, [
  bool forFieldValue = false,
]) {
  if (originAttributes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(originAttributes.toMap());

  // Add any Firestore field values
  originAttributes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOriginAttributesListFirestoreData(
  List<OriginAttributesStruct>? originAttributess,
) =>
    originAttributess
        ?.map((e) => getOriginAttributesFirestoreData(e, true))
        .toList() ??
    [];
