import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Zona Extendida Group Code

class ZonaExtendidaGroup {
  static String baseUrl = 'http://zonaextendida.com/';
  static Map<String, String> headers = {};
  static ObtenerValorCall obtenerValorCall = ObtenerValorCall();
}

class ObtenerValorCall {
  Future<ApiCallResponse> call({
    String? numero = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Obtener Valor',
      apiUrl: '${ZonaExtendidaGroup.baseUrl}consultarGuia.php?numero=${numero}',
      callType: ApiCallType.POST,
      headers: {
        ...ZonaExtendidaGroup.headers,
        'Content-Type': 'multipart/form-data',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

/// End Zona Extendida Group Code

/// Start Generar guia Group Code

class GenerarGuiaGroup {
  static LoginCall loginCall = LoginCall();
  static ShipmentsCall shipmentsCall = ShipmentsCall();
  static ParcelCall parcelCall = ParcelCall();
  static ConfirmarTarifaCall confirmarTarifaCall = ConfirmarTarifaCall();
  static ObtenerUrlCall obtenerUrlCall = ObtenerUrlCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'LoginCall',
        'variables': {
          'email': email,
          'password': password,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
}

class ShipmentsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
    String? opostalCode = '',
    String? oname = '',
    String? ocompany = '',
    String? ophone = '',
    String? ocallingCode = '',
    int? ocountryId,
    String? ostate = '',
    String? ostreet = '',
    String? oneighborhood = '',
    String? ocity = '',
    String? oreference = '',
    String? dpostalCode = '',
    String? dname = '',
    String? dcompany = '',
    int? dcountryId,
    String? dstate = '',
    String? dstreet = '',
    String? dneighborhood = '',
    String? dcity = '',
    String? dreference = '',
    String? dphone = '',
    String? dcallingCode = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ShipmentsCall',
        'variables': {
          'token': token,
          'email': email,
          'opostalCode': opostalCode,
          'oname': oname,
          'ocompany': ocompany,
          'ophone': ophone,
          'ocallingCode': ocallingCode,
          'ocountryId': ocountryId,
          'ostate': ostate,
          'ostreet': ostreet,
          'oneighborhood': oneighborhood,
          'ocity': ocity,
          'oreference': oreference,
          'dpostalCode': dpostalCode,
          'dname': dname,
          'dcompany': dcompany,
          'dcountryId': dcountryId,
          'dstate': dstate,
          'dstreet': dstreet,
          'dneighborhood': dneighborhood,
          'dcity': dcity,
          'dreference': dreference,
          'dphone': dphone,
          'dcallingCode': dcallingCode,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
}

class ParcelCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
    int? shipId,
    String? weight = '',
    String? length = '',
    String? height = '',
    String? width = '',
    String? contents = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ParcelCall',
        'variables': {
          'token': token,
          'email': email,
          'shipId': shipId,
          'weight': weight,
          'length': length,
          'height': height,
          'width': width,
          'contents': contents,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic shipmentid(dynamic response) => getJsonField(
        response,
        r'''$.data.shipment_id''',
      );
}

class ConfirmarTarifaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
    int? shipId,
    int? serviceId,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ConfirmarTarifaCall',
        'variables': {
          'token': token,
          'email': email,
          'shipId': shipId,
          'serviceId': serviceId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic shipId(dynamic response) => getJsonField(
        response,
        r'''$.data.shipment_id''',
      );
  dynamic labelurl(dynamic response) => getJsonField(
        response,
        r'''$.data.label_url''',
      );
}

class ObtenerUrlCall {
  Future<ApiCallResponse> call({
    String? shipId = '',
    String? token = '',
    String? email = '',
    String? gl = '[]',
    String? user = '[]',
    String? serv = '[]',
    String? dest = '[]',
    String? orig = '[]',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ObtenerUrlCall',
        'variables': {
          'shipId': shipId,
          'token': token,
          'email': email,
          'gl': gl,
          'user': user,
          'serv': serv,
          'dest': dest,
          'orig': orig,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status''',
      );
  dynamic guiastatus(dynamic response) => getJsonField(
        response,
        r'''$.data.step''',
      );
  dynamic rastreo(dynamic response) => getJsonField(
        response,
        r'''$.data.generated_label.tracking_number''',
      );
  dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data.generated_label.file.url''',
      );
}

/// End Generar guia Group Code

class ConsultaCPCall {
  static Future<ApiCallResponse> call({
    String? cp = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ConsultaCPCall',
        'variables': {
          'cp': cp,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic estado(dynamic response) => getJsonField(
        response,
        r'''$.codigo_postal.estado''',
      );
  static dynamic municipio(dynamic response) => getJsonField(
        response,
        r'''$.codigo_postal.municipio''',
      );
  static dynamic colonias(dynamic response) => getJsonField(
        response,
        r'''$.codigo_postal.colonias''',
        true,
      );
}

class ZonaExtendidaCall {
  static Future<ApiCallResponse> call({
    String? copo = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ZonaExtendidaCall',
        'variables': {
          'copo': copo,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.pageProps.result.msg''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
